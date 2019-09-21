//
//  SearchViewController.swift
//  Pokedex2
//
//  Created by Athena Leong on 9/18/19.
//  Copyright © 2019 Athena. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {
    
    
    @IBOutlet weak var pokedexButton: UIButton!
    @IBOutlet weak var advanceSearchButton: UIButton!
    @IBOutlet weak var goLuckyButton: UIButton!
    
    
    var mode : String?
    var pokemonList = PokemonGenerator.getPokemonArray()
    

    
    //Go Lucky
    var randomIndex = [Int]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        
        
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any? ) {
        if segue.identifier == "searchToResult"{
            let destinationVC = segue.destination as! TabBarViewController
            destinationVC.randomIndex = randomIndex
            destinationVC.mode = mode
        }
        else if segue.identifier == "searchToAdvanceSearch" {
            let destinationVC = segue.destination as! AdvanceSearchViewController
        }
        else if segue.identifier == "searchToResult2" {
            let destinationVC = segue.destination as! TabBarViewController
            destinationVC.mode = mode 
        }
    }
    
    func goLucky(){
        randomIndex = [Int]()
        for _ in 1...20{
            randomIndex.append(Int.random(in: 1..<pokemonList.count))
            randomIndex.sort()
        }
    }
    
    
    @IBAction func advanceSearchPressed(_ sender: Any) {
        performSegue(withIdentifier: "searchToAdvanceSearch", sender: self)
    }
    
    @IBAction func goLuckyPressed(_ sender: Any) {
        goLucky()
        mode = "Go Lucky"
        performSegue(withIdentifier: "searchToResult", sender: self)
    }
    
    @IBAction func pokedexPressed(_ sender: Any) {
        mode = "Pokedex"
        performSegue(withIdentifier: "searchToResult2", sender: self)
    }
    
 
    
}





