//
//  BMITableViewController.swift
//  BMITrackingApp
//
//  Created by Jason on 2019-12-12.
//  Copyright © 2019 centennialcollege. All rights reserved.
//

import UIKit


class TodoTableViewController: UITableViewController {
    

    var importancestar = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

    }

    //the number of the cell
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return resultsController.sections?[section].numberOfObjects ?? 0
    }

    //set tableview cell
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodoCell", for: indexPath)
        
        // Configure the cell...
        let data = resultsController.object(at: indexPath)
        //edit priotities: low with nothing, mid with ❗️, high with ‼️
            cell.textLabel?.text = data.name

        return cell
    }
    
    //left slide to delete
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let action = UIContextualAction(style: .destructive, title: "Delete") { (action, view, completion) in
            let todo = self.resultsController.object(at: indexPath)
            self.resultsController.managedObjectContext.delete(todo)
            do {
                try self.resultsController.managedObjectContext.save()
                completion(true)
            } catch {
                print("delete failed: \(error)")
                completion(false)
            }
        }
        action.backgroundColor = .red
        return UISwipeActionsConfiguration(actions:[action])
    }
    
    
    //selectrow to edit
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "ShowAddTodo", sender: tableView.cellForRow(at: indexPath))}
        
    //prepare managedContext
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        if let _ = sender as? UIBarButtonItem, let vc = segue.destination as? CalculatorController {
            vc.managedContext = resultsController.managedObjectContext
        }
        

    }
}


extension TodoTableViewController: NSFetchedResultsControllerDelegate {
    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.beginUpdates()
    }
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.endUpdates()
    }
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        switch type {
        //insert
        case .insert:
            if let indexPath = newIndexPath{
                tableView.insertRows(at: [indexPath], with: .automatic)
            }
        //delete
        case .delete:
            if let indexPath = indexPath{
                tableView.deleteRows(at: [indexPath], with: .automatic)
            }

        default:
            break
        }
    }
}
