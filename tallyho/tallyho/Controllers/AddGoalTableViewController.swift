//
//  AddGoalTableViewController.swift
//  tallyho
//
//  Created by Rikki Tomiko Ehrhart on 4/5/24.
//

import UIKit

class AddGoalTableViewController: UITableViewController {

    
    /*
    ***************     OUTLETS AND VARIABLES     ***************
                                                               */
    
    
    
    
    
    
    /*
    ***************     LOADS AND LOADING     ***************
                                                           */
    override func viewDidLoad() {
        super.viewDidLoad()

        
        // This sets the background of the table view to the orange and blue gradient background image
        tableView.backgroundView = UIImageView(image: UIImage(named: "BlueGreenBackground"))
        
        
        
        
        
    }
 

    

    
    /*
    ***************     APPEARANCE     ***************
                                                    */
    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        // Sets the section header to white and adds a top padding
        if let headerView = view as? UITableViewHeaderFooterView {
            headerView.textLabel?.textColor = .white
            tableView.sectionHeaderTopPadding = 15.0
        }
    }

//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "AddCell")
//        let cell = tableView.dequeueReusableCell(withIdentifier: "AddCell", for: indexPath)
//        
//        // Sets background of static cell to opaque
//        cell.backgroundColor = UIColor(ciColor: CIColor(red: 255, green: 255, blue: 255, alpha: 0.25))
//        
//        return cell
//    }
    
    

    
}
