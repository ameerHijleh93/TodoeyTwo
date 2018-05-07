//
//  TodayListViewController.swift
//  TodoeyTwo
//
//  Created by ameer on 5/3/18.
//  Copyright © 2018 ameer. All rights reserved.
//

import UIKit
import CoreData
class TodayListViewController: UITableViewController {
    var ItemArray = [Item]()
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    //let defultes = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
      print( FileManager.default.urls(for: .documentDirectory, in: .userDomainMask))
       // print(DataFilePath)
      LoadItem()
//        let newItem = Item()
//        newItem.title = "one"
//        ItemArray.append(newItem)
//
//
//        let newItem2 = Item()
//        newItem2.title = "two"
//        ItemArray.append(newItem2)
//
//
//        let newItem3 = Item()
//        newItem3.title = "three"
//        ItemArray.append(newItem3)
//
//        let newItem4 = Item()
//        newItem4.title = "three"
//        ItemArray.append(newItem4)
//
    }
        
        
//        if let   items = defultes.array(forKey: "ToDoListAraay") as? [Item] {
//            ItemArray = items }
//        }
       
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return  ItemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //let cell = UITableViewCell(style: .default, reuseIdentifier: "ToDoUtemCell")
       // print("kijuhygtrfejh6yg5tr")
        let item = ItemArray[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoUtemCell", for: indexPath)
        cell.textLabel?.text = item.title
        cell.accessoryType = item.done  ? .checkmark : .none
        
//        if item.done == true {
//        cell.accessoryType = .checkmark
//        }else{
//            cell.accessoryType = .none
//        }
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
        ItemArray[indexPath.row].done = !ItemArray[indexPath.row].done
//        context.delete(ItemArray[indexPath.row])
//        ItemArray.remove(at: indexPath.row)
      
        //  ItemArray[indexPath.row].setValue("completed", forKey: "titel")
        SavItems()
//        if ItemArray[indexPath.row].done == false{
//            ItemArray[indexPath.row].done = true
//        }else{
//            ItemArray[indexPath.row].done = false
//        }
//        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
//        tableView.cellForRow(at: indexPath)?.accessoryType = .none
//
//        }else {
//        tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
//        }
       // tableView.reloadData()
        tableView.deselectRow(at: indexPath, animated: true)
       
    }
    @IBAction func AddButtonPresed(_ sender: UIBarButtonItem) {
         var textFiled = UITextField()
        
        let alert = UIAlertController(title: "add new today item", message: "jhgfdsa", preferredStyle: .alert)
       // newItem.title = textFiled.text!
        
        let action = UIAlertAction(title: "add item", style: .default) { (action) in
            
            let newItem = Item(context: self.context)
            newItem.title = textFiled.text!
            newItem.done = false
        self.ItemArray.append(newItem)
           self.SavItems()
           // self.defultes.set(self.ItemArray, forKey: "ToDoListAraay")
            
        }
          
           
            
            alert.addTextField { (alertTextField) in
                alertTextField.placeholder = "creat new item"
                //  print(alertTextField.text)
                textFiled = alertTextField
                
            }
            alert.addAction(action)
            present(alert , animated: true , completion: nil)
            
        
            
    }
    func SavItems(){
        let encoder = PropertyListEncoder()
        do {
          try  context.save()
        }catch{
            print("eeerwwwwwwwwwwwwwwwwwwwwwwwwwwwww \(error)")
        }
        self.tableView.reloadData()
    }
    func LoadItem(){

        let requset :NSFetchRequest<Item> = Item.fetchRequest()
        do {
          ItemArray = try context.fetch(requset)
        } catch {
            print("erorrrrrrrrrrrrrrrrrrrr")
        }

    }
}


