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
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let gesture = UISwipeGestureRecognizer(target: self, action: #selector(dismiss(fromGesture:)))
        tableView.addGestureRecognizer(gesture)
    }
    
    @objc func dismiss(fromGesture gesture: UISwipeGestureRecognizer) {
        navigationController?.interactivePopGestureRecognizer?.isEnabled = false
    }
}
