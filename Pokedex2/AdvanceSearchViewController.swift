//
//  AdvanceSearchViewController.swift
//  Pokedex2
//
//  Created by Athena Leong on 9/18/19.
//  Copyright © 2019 Athena. All rights reserved.
//

import UIKit

class AdvanceSearchViewController: UIViewController {
    
    //Type
    @IBOutlet weak var bugButton: UIButton!
    @IBOutlet weak var darkButton: UIButton!
    @IBOutlet weak var dragonButton: UIButton!
    @IBOutlet weak var electricButton: UIButton!
    @IBOutlet weak var fairyButton: UIButton!
    @IBOutlet weak var fightingButton: UIButton!
    @IBOutlet weak var fireButton: UIButton!
    @IBOutlet weak var flyingButton: UIButton!
    @IBOutlet weak var ghostButton: UIButton!
    @IBOutlet weak var grassButton: UIButton!
    @IBOutlet weak var groundButton: UIButton!
    @IBOutlet weak var iceButton: UIButton!
    @IBOutlet weak var normalButton: UIButton!
    @IBOutlet weak var poisonButton: UIButton!
    @IBOutlet weak var psychicButton: UIButton!
    @IBOutlet weak var rockButton: UIButton!
    @IBOutlet weak var steelButton: UIButton!
    @IBOutlet weak var waterButton: UIButton!
    
    // Health, Attack & Defense

    @IBOutlet weak var hpBar: UISlider!
    @IBOutlet weak var apBar: UISlider!
    @IBOutlet weak var dpBar: UISlider!
    @IBOutlet weak var hpLabel: UILabel!
    @IBOutlet weak var apLabel: UILabel!
    @IBOutlet weak var dpLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    
    // Other UIs
    @IBOutlet weak var applyButton: UIButton!
    
    //Health, Attach & Defense
    var minHP = 90
    var minAP = 90
    var minDP = 90
    
    //type
    var selectedType = [String]()
    var type = ["Bug","Dark","Dragon", "Electric","Fairy","Fighting","Fire","Flying","Ghost","Grass","Ground","Ice","Normal","Poison","Psychic","Rock","Steel","Water"]

    //Others
    var mode : String?
    
    
    override func viewDidLoad() {
        minHP = Int(hpBar.value)
        minAP = Int(apBar.value)
        minDP = Int(dpBar.value)
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! TabBarViewController
        destinationVC.selectedType = selectedType
        destinationVC.minHP = minHP
        destinationVC.minAP = minAP
        destinationVC.minDP = minDP
        destinationVC.mode = mode
    }
    
    
    /******************************************** Button Pressed ************************************************************/
    
  
    @IBAction func hpValueChange(_ sender: Any) {
        minHP = Int(hpBar.value)
        hpLabel.text = "Health Points : \(minHP)"
        
    }
    
    
    @IBAction func apValueChange(_ sender: Any) {
        minAP = Int(apBar.value)
        apLabel.text = "Attack Points : \(minAP)"
    }
    
    
    @IBAction func dpValueChange(_ sender: Any) {
        minDP = Int(dpBar.value)
        dpLabel.text = "Defense Points : \(minDP)"
    }
    
    func updateType(){
        var typeString = "Type :"
        for type in selectedType{
            typeString = typeString + " " + type + ","
        }
        typeLabel.text = typeString
    }

    /******************************************** Button Pressed ************************************************************/
    
    @IBAction func Button0Pressed(_ sender: Any) {
        if selectedType.contains(type[0]){
            let position = selectedType.firstIndex(of: type[0])!
            selectedType.remove(at: position)
        }
        else {
            selectedType.append(type[0])
        }
        updateType()
        
    }
    
    @IBAction func Button1Pressed(_ sender: Any) {
        if selectedType.contains(type[1]){
            let position = selectedType.firstIndex(of: type[1])!
            selectedType.remove(at: position)
        }
        else {
            selectedType.append(type[1])
        }
        updateType()
    }
    
    @IBAction func Button2Pressed(_ sender: Any) {
        if selectedType.contains(type[2]){
            let position = selectedType.firstIndex(of: type[2])!
            selectedType.remove(at: position)
        }
        else {
            selectedType.append(type[2])
        }
        updateType()
    }
    
    @IBAction func Button3Pressed(_ sender: Any) {
        if selectedType.contains(type[3]){
            let position = selectedType.firstIndex(of: type[3])!
            selectedType.remove(at: position)
        }
        else {
            selectedType.append(type[3])
        }
        updateType()
    }
    
    @IBAction func Button4Pressed(_ sender: Any) {
        if selectedType.contains(type[4]){
            let position = selectedType.firstIndex(of: type[4])!
            selectedType.remove(at: position)
        }
        else {
            selectedType.append(type[4])
        }
        updateType()
    }
    
    @IBAction func Button5Pressed(_ sender: Any) {
        if selectedType.contains(type[5]){
            let position = selectedType.firstIndex(of: type[5])!
            selectedType.remove(at: position)
        }
        else {
            selectedType.append(type[5])
        }
        updateType()
    }
    
    @IBAction func Button6Pressed(_ sender: Any) {
        if selectedType.contains(type[6]){
            let position = selectedType.firstIndex(of: type[6])!
            selectedType.remove(at: position)
        }
        else {
            selectedType.append(type[6])
        }
        updateType()
    }
    
 
    
    @IBAction func Button7Pressed(_ sender: Any) {
        if selectedType.contains(type[7]){
            let position = selectedType.firstIndex(of: type[7])!
            selectedType.remove(at: position)
        }
        else {
            selectedType.append(type[7])
        }
        updateType()
    }
    
    @IBAction func button8Pressed(_ sender: Any) {
        if selectedType.contains(type[8]){
            let position = selectedType.firstIndex(of: type[8])!
            selectedType.remove(at: position)
        }
        else {
            selectedType.append(type[8])
        }
        updateType()
    }
    
    @IBAction func button9Pressed(_ sender: Any) {
        if selectedType.contains(type[9]){
            let position = selectedType.firstIndex(of: type[9])!
            selectedType.remove(at: position)
        }
        else {
            selectedType.append(type[9])
        }
        updateType()
    }
    
    @IBAction func button10Pressed(_ sender: Any) {
        if selectedType.contains(type[10]){
            let position = selectedType.firstIndex(of: type[10])!
            selectedType.remove(at: position)
        }
        else {
            selectedType.append(type[10])
        }
        updateType()
    }
    
    @IBAction func button11Pressed(_ sender: Any) {
        if selectedType.contains(type[11]){
            let position = selectedType.firstIndex(of: type[11])!
            selectedType.remove(at: position)
        }
        else {
            selectedType.append(type[11])
        }
        updateType()
    }
    
    @IBAction func button12Pressed(_ sender: Any) {
        if selectedType.contains(type[12]){
            let position = selectedType.firstIndex(of: type[12])!
            selectedType.remove(at: position)
        }
        else {
            selectedType.append(type[12])
        }
        updateType()
    }
    
    @IBAction func button13Pressed(_ sender: Any) {
        if selectedType.contains(type[13]){
            let position = selectedType.firstIndex(of: type[13])!
            selectedType.remove(at: position)
        }
        else {
            selectedType.append(type[13])
        }
        updateType()
    }
    
    @IBAction func button14Pressed(_ sender: Any) {
        if selectedType.contains(type[14]){
            let position = selectedType.firstIndex(of: type[14])!
            selectedType.remove(at: position)
        }
        else {
            selectedType.append(type[14])
        }
        updateType()
    }
    
    @IBAction func button15Pressed(_ sender: Any) {
        if selectedType.contains(type[15]){
            let position = selectedType.firstIndex(of: type[15])!
            selectedType.remove(at: position)
        }
        else {
            selectedType.append(type[15])
        }
        updateType()
    }
        
    
    @IBAction func button16Pressed(_ sender: Any) {
        if selectedType.contains(type[16]){
            let position = selectedType.firstIndex(of: type[16])!
            selectedType.remove(at: position)
        }
        else {
            selectedType.append(type[16])
        }
        updateType()
    }
    
    @IBAction func button17Pressed(_ sender: Any) {
        if selectedType.contains(type[17]){
            let position = selectedType.firstIndex(of: type[17])!
            selectedType.remove(at: position)
        }
        else {
            selectedType.append(type[17])
        }
        updateType()
    }

/******************************************** Apply Button Pressed ************************************************************/
    
    @IBAction func applyButtonPressed(_ sender: Any) {
        mode = "Advance Search"
        performSegue(withIdentifier: "advanceSearchToResult", sender: self)

    }
    
}

class CustomSlider: UISlider {
    override func trackRect(forBounds bounds: CGRect) -> CGRect {
        let point = CGPoint(x: bounds.minX, y: bounds.midY)
        return CGRect(origin: point, size: CGSize(width: bounds.width, height: 20))
    }
    
}

