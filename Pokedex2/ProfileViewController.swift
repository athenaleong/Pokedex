//
//  ProfileViewController.swift
//  Pokedex2
//
//  Created by Athena Leong on 9/18/19.
//  Copyright © 2019 Athena. All rights reserved.
//

import UIKit
import SafariServices

class ProfileViewController: UIViewController {
    
    //Stats
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var profileName: UILabel!
    @IBOutlet weak var profileSpecies: UILabel!
    @IBOutlet weak var profileHP: UILabel!
    @IBOutlet weak var profileAP: UILabel!
    @IBOutlet weak var profileNumber: UILabel!
    @IBOutlet weak var profileDP: UILabel!
    @IBOutlet weak var profileSPA: UILabel!
    @IBOutlet weak var profileSPD: UILabel!
    @IBOutlet weak var profileSpeed: UILabel!
    @IBOutlet weak var profileTotal: UILabel!
    @IBOutlet weak var urlButton: UIButton!
    
    var selectedIndex : Int?
    var selectedPokemon : Pokemon?
    var pokemonList = [Pokemon]()
    var filterPokemonList = [Pokemon]()
    var favoritePokemonList = [String]()
    var favoriteStatus = false
    

    //Favorite
    @IBOutlet weak var favoriteButton: UIButton!
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        selectedPokemon = filterPokemonList[selectedIndex!]
        profileName.text = selectedPokemon!.name
        profileNumber.text = "Number : \(selectedPokemon!.number!)"
        profileHP.text = "Health Points : \(selectedPokemon!.health!)"
        profileAP.text = "Attack Points : \(selectedPokemon!.attack!)"
        profileDP.text = "Defense Points : \(selectedPokemon!.defense!)"
        profileSPA.text = "Sp.Attack : \(selectedPokemon!.specialAttack!)"
        profileSPD.text = "Sp.Defense : \(selectedPokemon!.specialDefense!)"
        profileSpeed.text = "Speed : \(selectedPokemon!.speed!)"
        profileTotal.text = "Total : \(selectedPokemon!.total!)"
        profileSpecies.text = "Species : \(selectedPokemon!.species!)"
        
        profileImage.sd_setImage(with: URL(string: selectedPokemon!.imageUrl))
        
        if exists(key: "favPoke"){
            favoritePokemonList = UserDefaults.standard.array(forKey: "favPoke") as! [String]
            updatefavoriteButton()
        }
        
    }
    

    @IBAction func favButtonPressed(_ sender: Any) {
        
        if !favoritePokemonList.contains(filterPokemonList[selectedIndex!].name){
            favoritePokemonList.append(filterPokemonList[selectedIndex!].name)
            UserDefaults.standard.set(favoritePokemonList, forKey: "favPoke")
            updatefavoriteButton()
        }
        else{
            var pokeindex = favoritePokemonList.firstIndex(of: filterPokemonList[selectedIndex!].name)!
            favoritePokemonList.remove(at: pokeindex)
            UserDefaults.standard.set(favoritePokemonList, forKey: "favPoke")
            updatefavoriteButton()
        }
        //favoriteButton.setTitle("Added", for: .normal)
    }
    
    func updatefavoriteButton(){
        favoriteStatus = favoritePokemonList.contains(filterPokemonList[selectedIndex!].name)
        print(filterPokemonList[selectedIndex!].name!)
        print(favoriteStatus)
        
        if favoriteStatus{
            favoriteButton.setTitle("Remove from Favorite", for: .normal)
        }
        else{
            favoriteButton.setTitle("Add to Favorite", for: .normal)
        }
        
    }
    
    @IBAction func urlButtonPressed(_ sender: Any) {
        let link = "https://google.com/search?q=" + filterPokemonList[selectedIndex!].name!
        guard let url = URL(string: link) else { return }
        UIApplication.shared.open(url)
    }
    
    
    
    
    func exists(key: String) -> Bool {
        return UserDefaults.standard.object(forKey: key) != nil
        }

}
