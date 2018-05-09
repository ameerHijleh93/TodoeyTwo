//
//  CategoryTableViewController.swift
//  TodoeyTwo
//
//  Created by ameer on 5/8/18.
//  Copyright © 2018 ameer. All rights reserved.
//

import UIKit
import CoreData

class CategoryTableViewController: UITableViewController {
var category = [Category]()
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        LoadItem()
        print( FileManager.default.urls(for: .documentDirectory, in: .userDomainMask))
    }
    
   // MARK: - Table view data source method
        override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath)
        cell.textLabel?.text = category[indexPath.row].name
        return cell
    }
    
    // MARK: - Table view Delegat method
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "goToItems", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let DestenationVC = segue.destination as! TodayListViewController
        if  let indexPath = tableView.indexPathForSelectedRow {
            DestenationVC.selectedCategory = category[indexPath.row]
        }
    }
    
      // MARK: - Add New Category method
      override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return category.count
      }
    
      // MARK: - Table view Manipulation method
      func   savCategories(){
       do {
        try  context.save()
        }
       catch{
        print("eeerwwwwwwwwwwwwwwwwwwwwwwwwwwwww \(error)")
        }
       tableView.reloadData()
    }
    
    func LoadItem(with request :NSFetchRequest<Category> = Category.fetchRequest()) {
     //    let requset :NSFetchRequest<Category> = Category.fetchRequest()
         do {
            category = try context.fetch(request)
            }
        catch {
            print("erorrrrrrrrrrrrrrrrrrrr")
        }
    }
            @IBAction func addButtonPressd(_ sender: UIBarButtonItem) {
            var textFiled = UITextField()
            let alert = UIAlertController(title: "add new today item", message: "jhgfdsa", preferredStyle: .alert)
            let action = UIAlertAction(title: "Add", style: .default) { (action) in
            let newCategory = Category(context: self.context)
            newCategory.name = textFiled.text!
            self.category.append(newCategory)
            self.savCategories()
        }
            alert.addAction(action)
            alert.addTextField { (field) in
            textFiled = field
            textFiled.placeholder = "add anew category"
            self.tableView.reloadData()
        }
         present(alert , animated: true , completion: nil)
    }
}
