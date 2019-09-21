//
//  FavoriteViewController.swift
//  Pokedex2
//
//  Created by Athena Leong on 9/20/19.
//  Copyright © 2019 Athena. All rights reserved.
//

import UIKit

class FavoriteViewController: UIViewController {
    
    var pokemonList = PokemonGenerator.getPokemonArray()
    var favoritePokemonList = [String]()
    var favoritePokemon = [Pokemon]()
    var selectedIndex = 0
    
    @IBOutlet weak var favTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if exists(key : "favPoke"){
            favoritePokemonList = UserDefaults.standard.array(forKey: "favPoke") as! [String]
        }
        
        for name in favoritePokemonList{
            for poke in pokemonList{
                if poke.name == name{
                favoritePokemon.append(poke)
                }
            }
        }

        favTableView.delegate = self
        favTableView.dataSource = self
        
    }
    
    func exists(key: String) -> Bool {
        return UserDefaults.standard.array(forKey: key) != nil
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as!
        ProfileViewController
        destinationVC.filterPokemonList = favoritePokemon
        destinationVC.selectedIndex = selectedIndex
    }

}

extension FavoriteViewController: UITableViewDataSource,UITableViewDelegate{

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let pokemon = favoritePokemon[indexPath.row]
        let favCell = tableView.dequeueReusableCell(withIdentifier: "FavPokeCell") as! favPokemonCell
        
        favCell.setPokemon(poke: pokemon)
        
        return favCell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favoritePokemon.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        selectedIndex = indexPath.row
        performSegue(withIdentifier: "favoriteToProfile", sender: self)
    }

}


