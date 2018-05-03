//
//  TodayListViewController.swift
//  TodoeyTwo
//
//  Created by ameer on 5/3/18.
//  Copyright © 2018 ameer. All rights reserved.
//

import UIKit
class TodayListViewController: UITableViewController {
    var ItemArray = ["one" , "two" , "three"]
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return  ItemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoUtemCell", for: indexPath)
        cell.textLabel?.text = ItemArray[indexPath.row]
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
        tableView.cellForRow(at: indexPath)?.accessoryType = .none
        
        }else {
        tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark 
        }
        tableView.deselectRow(at: indexPath, animated: true)
       
    }
    @IBAction func AddButtonPresed(_ sender: UIBarButtonItem) {
         var textFiled = UITextField()
        let alert = UIAlertController(title: "add new today item", message: "jhgfdsa", preferredStyle: .alert)
        let action = UIAlertAction(title: "add item", style: .default) { (action) in
        self.ItemArray.append(textFiled.text!)
        self.tableView.reloadData()
        }
          
           
            
            alert.addTextField { (alertTextField) in
                alertTextField.placeholder = "creat new item"
                //  print(alertTextField.text)
                textFiled = alertTextField
                
            }
            alert.addAction(action)
            present(alert , animated: true , completion: nil)
            
            
            
    }
}

