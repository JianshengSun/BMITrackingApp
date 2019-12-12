//
//  TableViewController.swift
//  BMITrackingApp
//
//  Created by Jason on 2019-12-11.
//  Copyright © 2019 centennialcollege. All rights reserved.
//


import UIKit
import CoreData

class TableViewController: UITableViewController {
 
    var resultsController: NSFetchedResultsController<BMIData>!
    let coreDataStack = CoreDataStack()
    var importancestar = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //request
        let request: NSFetchRequest<BMIData> = BMIData.fetchRequest()
        let sortDescriptors = NSSortDescriptor(key: "date", ascending: true)
        
        //init
        request.sortDescriptors = [sortDescriptors]
        resultsController = NSFetchedResultsController(
            fetchRequest: request,
            managedObjectContext: coreDataStack.managedContext,
            sectionNameKeyPath: nil,
            cacheName: nil)
        //resultsController.delegate = self
        
        //fetch
        do {
            try resultsController.performFetch()
        } catch {
            print("Perform fetch error: \(error)")
        }
    }
    
    
}
