//
//  TableViewController.swift
//  BMITrackingApp
//
//  Created by Jason on 2019-12-13.
//  Copyright © 2019 centennialcollege. All rights reserved.
//

import UIKit
import Firebase

class TableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    

    var dataref: DatabaseReference!
    var dataList = [DataModle]()

    @IBOutlet weak var myTableView: UITableView!
    
    
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        

 

        dataref = Database.database().reference().child("data")
        dataref.observeSingleEvent(of: .value, with: { (snapshot) in
          // Get user value

            if snapshot.childrenCount>0 {
                self.dataList.removeAll()
                for case let snapshot as DataSnapshot in snapshot.children{
                for datas in snapshot.children.allObjects as![DataSnapshot]{
                    let value = snapshot.value as? NSDictionary
                    let username = value?["name"] as? String
                    let userresult = value?["result"] as? String
                    let userage = value?["age"] as? String
                    let userheight = value?["height"] as? String
                    let userweight = value?["weight"] as? String
                    let usergender = value?["gender"] as? String
                    
                    


                    
                    
                    
                    print("Hereeeeeeeeeeeeeeeeeeeeee")
                    print(username,userresult,userage,userheight,userweight,usergender)
                    
                    
                    let data = DataModle(age: userage as! String, gender: usergender as! String, height: userheight as! String, name: username as! String, result: userresult as! String, weight: userweight as! String)
                    
                    self.dataList.append(data)
                    
                }
                self.myTableView.reloadData()
            }

          // ...
          }
        }

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    )}


    // MARK: - Table view data source


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        dataList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "Cell")!
        
        let data: DataModle
        
        //avatar = avatarlist [indexPath.row]
        cell.textLabel?.text = "123"
        return cell
    }
    
    

    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
