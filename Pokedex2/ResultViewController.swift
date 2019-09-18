//
//  ResultViewController.swift
//  Pokedex2
//
//  Created by Athena Leong on 9/18/19.
//  Copyright © 2019 Athena. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    
    var pokemonList = PokemonGenerator.getPokemonArray()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        pokemonList.sort(by: { $0.number < $1.number})
    }

    

}

extension ResultViewController: UITableViewDataSource,UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pokemonList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let pokemon = pokemonList[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "PokeCell") as! PokemonCell
        cell.setPokemon(poke: pokemon)
        
        return cell
    }
}
