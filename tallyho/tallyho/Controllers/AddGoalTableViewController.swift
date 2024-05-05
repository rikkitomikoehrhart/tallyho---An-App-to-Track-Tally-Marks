//
//  AddGoalTableViewController.swift
//  tallyho
//
//  Created by Rikki Tomiko Ehrhart on 4/5/24.
//

import UIKit

class AddGoalTableViewController: UITableViewController {

    
    /* -------     OUTLETS AND VARIABLES     ------- */
    var sections: [Section] = []
    var selectedSection: Section?
    
    
    

    
    /* -------     LOADS AND LOADING     ------- */
    // VIEW DID LOAD
    override func viewDidLoad() {
        super.viewDidLoad()

        
        // This sets the background of the table view to the orange and blue gradient background image
        tableView.backgroundView = UIImageView(image: UIImage(named: "BlueGreenBackground"))
    }
 

    

    
    /* -------     APPEARANCE     ------- */
    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        // Sets the section header to white and adds a top padding
        if let headerView = view as? UITableViewHeaderFooterView {
            // Changes the text color ot white
            headerView.textLabel?.textColor = .white
            
            // adds a top padding
            tableView.sectionHeaderTopPadding = 15.0
        }
    }

    
    
    
    
    /* -------     SEGUES AND UNWINDS     ------- */
    // UNWIND - From Seleceted Section Screen to Add New Goal Screen with the new Selected Section
    @IBAction func unwindSaveToAddEditGoalScreen(segue: UIStoryboardSegue) {
        guard segue.identifier == "selectedSectionSegue", let sourceViewController = segue.source as? SectionSelectionTableViewController, let selection = sourceViewController.selectedSection else { return }
            
        print(selection)
    }

    // When the Select a Section row is pressed
    @IBAction func chooseSectionButtonPressed(_ sender: Any) {
 
    }
    
    
    
}
