//
//  TabBarViewController.swift
//  Pokedex2
//
//  Created by Athena Leong on 9/20/19.
//  Copyright © 2019 Athena. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController {
    
    //Advance Search
    var selectedType = [String]()
    var minHP : Int?
    var minDP : Int?
    var minAP : Int?
    
    //Search
    var mode : String?
    
    //Random
    var randomIndex = [Int]()
    
    //Favorite

    override func viewDidLoad() {
        super.viewDidLoad()
        

        // Do any additional setup after loading the view.
    }
    

}
