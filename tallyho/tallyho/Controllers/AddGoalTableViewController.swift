//
//  AddGoalTableViewController.swift
//  tallyho
//
//  Created by Rikki Tomiko Ehrhart on 4/5/24.
//

import UIKit

class AddGoalTableViewController: UITableViewController {

    
    /*
    ******************************       OUTLETS AND VARIABLES       ******************************
                                                                                                 */
    var sections: [Section] = []
    
    
    
    

    


    
    
    /*
    ********************************       LOADS AND LOADING       ********************************
                                                                                                 */
    override func viewDidLoad() {
        super.viewDidLoad()

        
        // This sets the background of the table view to the orange and blue gradient background image
        tableView.backgroundView = UIImageView(image: UIImage(named: "BlueGreenBackground"))
        
        
        print(sections)
        
    }
 

    

    
    /*
    ************************************       APPEARANCE      ************************************
                                                                                                 */
    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        // Sets the section header to white and adds a top padding
        if let headerView = view as? UITableViewHeaderFooterView {
            headerView.textLabel?.textColor = .white
            tableView.sectionHeaderTopPadding = 15.0
        }
    }

    
    
    
    
    
    /*
    *******************************       SEGUES AND UNWINDS       ********************************
                                                                                                 */
    
    @IBAction func unwindSaveToAddEditGoalScreen(unwindSegue: UIStoryboardSegue) {}

    
    
    @IBAction func chooseSectionButtonPressed(_ sender: Any) {
 
    }
    
    
    
}
