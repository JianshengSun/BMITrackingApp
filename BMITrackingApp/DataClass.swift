//
//  DataClass.swift
//  BMITrackingApp
//
//  Created by Jason on 2019-12-14.
//  Copyright © 2019 centennialcollege. All rights reserved.
//

class DataModle {
    
    var age: String?
    var gender: String?
    var height: String?
    var name: String?
    var result: String?
    var weight: String?
    
    init(age: String?, gender: String?, height:String?, name:String?, result:String?, weight:String?) {
        self.age = age;
        self.gender = gender;
        self.height = height;
        self.name = name;
        self.result = result;
        self.weight = weight;
        
    }
    
    
}
