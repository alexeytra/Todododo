//
//  CategoryViewController.swift
//  Todododo
//
//  Created by Алексей Трапезников on 11.05.2020.
//  Copyright © 2020 Алексей Трапезников. All rights reserved.
//

import UIKit
//import CoreData
import RealmSwift

class CategoryViewController: UITableViewController {
    
    var categories: Results<Category>?
//    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    let realm = try! Realm()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadCategories()
        
        
    }


    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        var textField = UITextField()
        let alert = UIAlertController(title: "Add New Category", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add", style: .default) { (action) in
            
//            let newCategory = Category(context: self.context)
            let newCategory = Category()
            newCategory.name = textField.text!
            
            self.save(category: newCategory)
            
        }
        
        alert.addAction(action)
        
        alert.addTextField { (field) in
            textField = field
            textField.placeholder = "Add new category"
        }
        
        present(alert, animated: true, completion: nil)
    }
    
    //MARK: - TableView DataSource Methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories?.count ?? 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath)
        
        cell.textLabel?.text = categories?[indexPath.row].name ?? "no categories added yet"
        return cell
    }
    
    //MARK: -Delegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "goToItems", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! TodoListViewController
        if let indexPath = tableView.indexPathForSelectedRow {
            destinationVC.selectedCategory = categories?[indexPath.row]
        }
    }
    
    //MARK: -Data Manipulation
    
    func save(category: Category) {
        do {
//            try context.save()
            try realm.write{
                realm.add(category)
            }
        } catch {
            print ("Error saving category \(error)")
        }
        
        tableView.reloadData()
    }
    
    func loadCategories() {
//        let request: NSFetchRequest<Category> = Category.fetchRequest()
//
//        do {
//            categories = try context.fetch(request)
//        } catch {
//            print("Error loading categories \(error)")
//        }
        
        categories = realm.objects(Category.self)
        
        tableView.reloadData()
    }
}
