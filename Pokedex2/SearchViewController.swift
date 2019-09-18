//
//  SearchViewController.swift
//  Pokedex2
//
//  Created by Athena Leong on 9/18/19.
//  Copyright © 2019 Athena. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {

    @IBOutlet weak var AdvanceSearchButton: UIButton!
    @IBOutlet weak var GoLuckyButton: UIButton!
    @IBOutlet weak var Label: UILabel!
    var pokemonList = PokemonGenerator.getPokemonArray()
    var poke = [Pokemon]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    

        // Do any additional setup after loading the view.
    }

}


