//
//  ResultViewController.swift
//  Pokedex2
//
//  Created by Athena Leong on 9/18/19.
//  Copyright © 2019 Athena. All rights reserved.
//

import UIKit
import SDWebImage



class ResultViewController: UIViewController {
    
    //tableView
    @IBOutlet weak var tableView: UITableView!
    
    // from Search VC
    var randomIndex = [Int]()
    
    // from Advance Search VC
    var selectedType = [String]()
    var minHP : Int?
    var minDP : Int?
    var minAP : Int?
    
    //filter function
    var filterPokemonList = [Pokemon]()

    //search function
    let searchController = UISearchController(searchResultsController: nil )
    var searchPokemon = [Pokemon]()
    @IBOutlet weak var searchBar: UISearchBar!
    
    //others
    var pokemonList = PokemonGenerator.getPokemonArray()
    var selectedIndex = 0
    var mode : String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tabBarData = tabBarController as! TabBarViewController
        mode = tabBarData.mode
        randomIndex = tabBarData.randomIndex
        selectedType = tabBarData.selectedType
        minHP = tabBarData.minHP
        minAP = tabBarData.minAP
        minDP = tabBarData.minDP
        
        tableView.delegate = self
        tableView.dataSource = self
        pokemonList.sort(by: { $0.number < $1.number})
        if mode == nil {
            filterPokemonList = pokemonList
        }
        else if mode! == "Advance Search"{
            advanceFilterPokemon(typeCriteria : selectedType)
        }
        else if mode! == "Go Lucky"{
            luckyFilterPokemon()
        }
        else if mode! == "Pokedex"{
            filterPokemonList = pokemonList
        }
        // Setup the Search Controller
        searchBar.delegate = self
        

    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! ProfileViewController
        destinationVC.selectedIndex = selectedIndex
        destinationVC.pokemonList = pokemonList
        if searchPokemon.count != 0 {
            destinationVC.filterPokemonList = searchPokemon
        } else {
            destinationVC.filterPokemonList = filterPokemonList
        }
        
    }
    
    func advanceFilterPokemon(typeCriteria: [String]){
         for pokemon in pokemonList{
            if advanceTypeFiltering(typeCriteria: typeCriteria, poke : pokemon) && pokemon.attack! >= minAP! && pokemon.defense! >= minDP! && pokemon.health! >= minHP! {
                filterPokemonList.append(pokemon)
            }
        }
    }
    
    func advanceTypeFiltering(typeCriteria: [String], poke : Pokemon) -> Bool{
        var typePresent = true
        for selectedType in typeCriteria{
            if !poke.types.contains(selectedType){
                typePresent = false
            }
        }
        return typePresent
    }
    
    func luckyFilterPokemon(){
        for i in randomIndex{
            filterPokemonList.append(pokemonList[i])
        }
    }
    
    // MARK: - Private instance methods
    
    func filterContentForSearchText(_ searchText: String, scope: String = "All") {
        searchPokemon = filterPokemonList.filter({( pokemon : Pokemon) -> Bool in
            return pokemon.name.lowercased().contains(searchText.lowercased())
        })
        tableView.reloadData()
    }

    
}

extension ResultViewController: UITableViewDataSource,UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searchPokemon.count != 0 {
            return searchPokemon.count
        }
        
        return filterPokemonList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let pokemon : Pokemon
        if searchPokemon.count != 0 {
            pokemon = searchPokemon[indexPath.row]
        }
        else{
            pokemon = filterPokemonList[indexPath.row]
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: "PokeCell") as! PokemonCell
        cell.setPokemon(poke: pokemon)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        selectedIndex = indexPath.row
        performSegue(withIdentifier: "resultToProfile", sender: self)
    }
}



extension ResultViewController: UISearchBarDelegate {
    // MARK: - UISearchResultsUpdating Delegate
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print("running")
        filterContentForSearchText(searchText)
    }
}


