//
//  Inventory.swift
//  roomiesapp
//
//  Created by Gebruiker on 07-06-18.
//  Copyright © 2018 Gebruiker. All rights reserved.
//

import Foundation
import UIKit

class Inventory: UITableViewController {
    

    var inventoryList = [AddInventory]()
    

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return inventoryList.count
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.leftBarButtonItem = editButtonItem
        
        if let savedInventory = AddInventory.loadToDos() {
            inventoryList = savedInventory
        } else {
            inventoryList = AddInventory.loadSampleInventory()
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt
    indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "AddInventoryCellIdentifier") else {
            fatalError("Could not dequeue a cell")
        }
        
        let addInvent = inventoryList[indexPath.row]
        cell.textLabel?.text = addInvent.whatToAdd
        return cell
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt
    indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            inventoryList.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    @IBAction func unwindInventoryList(segue: UIStoryboardSegue) {
    
    }
}
