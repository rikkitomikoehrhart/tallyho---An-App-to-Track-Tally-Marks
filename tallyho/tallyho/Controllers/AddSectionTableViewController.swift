//
//  AddSectionTableViewController.swift
//  tallyho
//
//  Created by Rikki Tomiko Ehrhart on 5/3/24.
//

import UIKit

class AddSectionTableViewController: UITableViewController {
    
    /* -------     OUTLETS AND VARIABLES     ------- */
    @IBOutlet var sectionNameTextField: UITextField!
    @IBOutlet var saveButton: UIBarButtonItem!
    
    
    
    
    
    /* -------     LOADS AND LOADING     ------- */
    // VIEW DID LOAD
    override func viewDidLoad() {
        super.viewDidLoad()

        
        // This sets the background of the table view to the orange and blue gradient background image
        tableView.backgroundView = UIImageView(image: UIImage(named: "BlueGreenBackground"))
    }


    
    
    
    /* -------       TABLE SECTIONS     ------- */
    // POPULATES NUMBER OF SECTIONS TO DISPLAY IN THE TABLE
    override func numberOfSections(in tableView: UITableView) -> Int {
       // Returns the number of sections to populate
        return 1
   }

    
    
    
    
    /* -------       TABLE ROWS     ------- */
    // POPULATES THE NUMBER OF ROWS IN SECTION
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    

    
    
    /* -------     APPEARANCE     ------- */
    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        // Sets the section header to white and adds a top padding
        if let headerView = view as? UITableViewHeaderFooterView {
            // Changes the text color to white
            headerView.textLabel?.textColor = .white
            
            // Adds a top padding
            tableView.sectionHeaderTopPadding = 15.0
        }
    }
    
    
    
    
    
    /* -------     ACTIONS AND FUNCTIONS     ------- */
    // Saves the new section when the Save button is tapped
    @IBAction func saveButtonTapped(_ sender: Any) {
        // Checks to see if there is any text in the text field
        if (sectionNameTextField.hasText) {
            // Creates the Alert
            let alert = UIAlertController(title: "Add New Section?", message: "Add new section named ''\(sectionNameTextField.text!)''?", preferredStyle: .alert)
            
            // Adds the Cancel Action to the Alert
            alert.addAction(UIAlertAction(title: "NO", style: .cancel, handler: { (_) in
                // do nothing
            }))
            
            // Adds the Add Action to the Alert
            alert.addAction(UIAlertAction(title: "YES", style: .default, handler: { (_) in
                // Creates a new Seciton with the name provided
                let newSection = Section(name: self.sectionNameTextField.text!, goals: [])
                
                // Adds the new section to the Sections list.
                Section.sections.append(newSection)

                // Empty the text field so the user can enter another new section
                self.sectionNameTextField.text = ""
            }))

            // Shows the alert
            self.present(alert, animated: true, completion: nil)
        }
    }
    

    
    
}
