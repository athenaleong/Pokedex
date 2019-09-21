//
//  favPokemonCell.swift
//  Pokedex2
//
//  Created by Athena Leong on 9/20/19.
//  Copyright © 2019 Athena. All rights reserved.
//

import UIKit
import SDWebImage

class favPokemonCell: UITableViewCell {
    
    @IBOutlet weak var pokeImage: UIImageView!
    @IBOutlet weak var pokeName: UILabel!
    @IBOutlet weak var pokeNumber: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func setPokemon(poke : Pokemon){
        pokeName.text = poke.name
        pokeNumber.text = "\(poke.number!)"
        pokeImage.sd_setImage(with: URL(string: poke.imageUrl))
    }
}
