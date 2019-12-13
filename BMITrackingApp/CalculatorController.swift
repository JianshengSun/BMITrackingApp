//
//  CalculatorController.swift
//  BMITrackingApp
//
//  Created by Jason on 2019-12-11.
//  Copyright © 2019 centennialcollege. All rights reserved.
//

import UIKit
import Firebase



class CalculatorController: UIViewController {
    

    
    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var ageText: UITextField!
    @IBOutlet weak var heightText: UITextField!
    @IBOutlet weak var weightText: UITextField!
    @IBOutlet weak var genderC: UISegmentedControl!
    @IBOutlet weak var heightC: UISegmentedControl!
    @IBOutlet weak var weightC: UISegmentedControl!
    @IBOutlet weak var submitBtn: UIButton!
    @IBOutlet weak var addhBtn: UIButton!
    @IBOutlet weak var informationText: UILabel!
    @IBOutlet weak var informationText2: UILabel!
    
    
    var heightn: Double = 0
    var weightn: Double = 0
    var result: Double = 0
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func SubmitBtn(_ sender: UIButton) {
        
        if heightText.text == ""||(weightText.text == "Imput here!"){
            heightText.text = "Imput here!"
            return
        }
        if (weightText.text == "")||(weightText.text == "Imput here!"){
            weightText.text = "Imput here!"
            return
        }
        
        //cm
        if (heightC.selectedSegmentIndex==0){
            heightn = Double(heightText.text!)!/100
        }
        // inch
        else{
            heightn = Double(heightText.text!)!*2.54/100
        }
        
        //kg
        if (weightC.selectedSegmentIndex==0){
            weightn = Double(weightText.text!)!
        }
        //lbs
        else {
            weightn = Double(weightText.text!)!/2.205
        }
        
        result = weightn/(heightn*heightn)
        
        var number : String = ""
        number = String(result)
        number = String(number.prefix(number.count - 13))
        
        informationText.text = "Your result  is  " + number + " !"
        
        if result < 16 {
            informationText2.text = "Your category is Sever Thinness!"
        }
        else if ((16 < result)&&(result < 17))||(result == 16) {
            informationText2.textColor = .white
            informationText2.text = "Your category is Moderate Thinness!"
        }
        else if ((17 < result)&&(result < 18.5))||(result == 17) {
            informationText2.textColor = .blue
            informationText2.text = "Your category is Midl Thinness!"
        }
        else if ((18.5 < result)&&(result < 25))||(result == 18.5) {
            informationText2.textColor = .green
            informationText2.text = "Your category is Normal!"
        }
        else if ((25 < result)&&(result < 30))||(result == 25) {
            informationText2.textColor = .yellow
            informationText2.text = "Your category is Overweight!"
        }
        else if ((30 < result)&&(result < 35))||(result == 30) {
            informationText2.textColor = .orange
            informationText2.text = "Your category is Obese ClassI!"
        }
        else if ((35 < result)&&(result < 40))||(result == 35) {
            informationText2.textColor = .red
            informationText2.text = "Your category is Obese ClassII!"
        }
        else if result > 40 {
            informationText2.textColor = .systemPink
            informationText2.text = "Your category is Obese ClassIII!"
        }
        
        addhBtn.isHidden = false

    }
    
    
    @IBAction func addhistory(_ sender: UIButton) {
        

        if nameText.text == ""{
            nameText.text = "Imput here!"
            return
        }
        if ageText.text == ""{
            nameText.text = "Imput here!"
            return
        }
        var dataref: DatabaseReference!

        dataref = Database.database().reference()
        

        
        dataref.child("data/\(NSDate())/\(nameText.text!)/name").setValue(nameText.text)
        dataref.child("data/\(NSDate())/\(nameText.text!)/age").setValue(ageText.text)
        dataref.child("data/\(NSDate())/\(nameText.text!)/gender").setValue(genderC.selectedSegmentIndex)
        dataref.child("data/\(NSDate())/\(nameText.text!)/height").setValue(heightn)
        dataref.child("data/\(NSDate())/\(nameText.text!)/weight").setValue(weightn)
        dataref.child("data/\(NSDate())/\(nameText.text!)/result").setValue(result)
        
        

        

        

    }
    

}


