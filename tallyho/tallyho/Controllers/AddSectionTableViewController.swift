//
//  AddSectionTableViewController.swift
//  tallyho
//
//  Created by Rikki Tomiko Ehrhart on 5/3/24.
//

import UIKit

class AddSectionTableViewController: UITableViewController {
    
    /*
    ******************************       OUTLETS AND VARIABLES       ******************************
                                                                                                 */
    
    @IBOutlet var sectionNameTextField: UITextField!
    

    
    
    
    
    /*
    ********************************       LOADS AND LOADING       ********************************
                                                                                                 */
    override func viewDidLoad() {
        super.viewDidLoad()


        
        // This sets the background of the table view to the orange and blue gradient background image
        tableView.backgroundView = UIImageView(image: UIImage(named: "BlueGreenBackground"))

    }

    
    
    
    
    
    /*
    **********************************       TABLE SECTIONS      **********************************
                                                                                                 */


    
    
    
    
    /*
    ************************************       TABLE ROWS      ************************************
                                                                                                 */
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
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
    ******************************       ACTIONS AND FUNCTIONS      *******************************
                                                                                                 */
    @IBAction func saveButtonPressed(_ sender: Any) {
   
    }
    
    
    

    
    
    
    /*
    ********************************       SEGUES AND UNWINDS      ********************************
                                                                                                 */
    
    
    
}
