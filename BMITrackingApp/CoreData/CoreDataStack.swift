//
//  CoreDataStack.swift
//  BMITrackingApp
//
//  Created by Jason on 2019-12-11.
//  Copyright © 2019 centennialcollege. All rights reserved.
//

import Foundation
import CoreData
//CoreData Srack
class CoreDataStack {
    var container: NSPersistentContainer{
        let container = NSPersistentContainer(name: "BMIData")
        container.loadPersistentStores {(description, error) in
            guard error == nil else {
                print("Error: \(error!)")
                return
            }
        }
        return container
    }
    
    var managedContext: NSManagedObjectContext {
        return container.viewContext
    }
}
