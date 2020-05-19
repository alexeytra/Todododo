//
//  SwipeTableViewController.swift
//  Todododo
//
//  Created by Алексей Трапезников on 18.05.2020.
//  Copyright © 2020 Алексей Трапезников. All rights reserved.
//

import UIKit
import SwipeCellKit

class SwipeTableViewController: UITableViewController, SwipeTableViewCellDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath, for orientation: SwipeActionsOrientation) -> [SwipeAction]? {
           guard orientation == .right else {return nil}
           
           let deleteAcrion = SwipeAction(style: .destructive, title: "Delete") { (action, indexPath) in
               self.updateModel(at: indexPath)
           }
           
           deleteAcrion.image = UIImage(named: "delete")
           
           return [deleteAcrion]
       }
       
       func tableView(_ collectionView: UICollectionView, editActionsOptionsForItemAt indexPath: IndexPath, for orientation: SwipeActionsOrientation) -> SwipeOptions {
           var options = SwipeOptions()
           options.expansionStyle = .destructive
           return options
       }
       
       override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! SwipeTableViewCell
           cell.delegate = self
           return cell
       }
       
       func updateModel(at indexPath: IndexPath) {
           
       }

}

