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
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    
    
    
    
    /*
    ************************************       TABLE ROWS      ************************************
                                                                                                 */
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }


    
    
    /*
    ******************************       ACTIONS AND FUNCTIONS      *******************************
                                                                                                 */
    
    
    

    
    
    
    /*
    ********************************       SEGUES AND UNWINDS      ********************************
                                                                                                 */
    
    // Unwind to Section Selection Screen:
    
}
