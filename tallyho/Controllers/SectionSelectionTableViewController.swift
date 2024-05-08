//
//  SectionSelectionTableViewController.swift
//  tallyho
//
//  Created by Rikki Tomiko Ehrhart on 5/3/24.
//

import UIKit
import Foundation

class SectionSelectionTableViewController: UITableViewController {
    
    /* -------     OUTLETS AND VARIABLES     -------*/
    var selectedSection: Section?
    
    
    

    
    /* --------     LOADS AND LOADING     ------- */
    // VIEW DID LOAD
    override func viewDidLoad() {
        super.viewDidLoad()

        // This sets the background of the table view to the orange and blue gradient background image
        tableView.backgroundView = UIImageView(image: UIImage(named: "BlueGreenBackground"))

        // Adds Edit Button to Nav Bar
        navigationItem.leftBarButtonItem = editButtonItem
        navigationItem.leftBarButtonItem?.tintColor = UIColor.white
    
        // Save changes to Phone
        Section.saveSections()
    }

    // VIEW WILL APPEAR
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // reloads table data
        tableView.reloadData()
    }
    
  
    
    
    
    /* -------     TABLE ROWS     ------- */
    // POPULATES THE NUMBER OF ROWS
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return Section.sections.count
    }

    // POPULATES THE DATA IN EACH ROW
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Declares a new cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "sectionRow", for: indexPath) as! SectionTableViewCell
        
        // Grabs the current section
        let section = Section.sections[indexPath.row]

        // Configure the cell
        cell.update(with: section)

        // Sets the background of the cell to be opaque white
        cell.backgroundColor = UIColor(ciColor: CIColor(red: 255, green: 255, blue: 255, alpha: 0.25))
        
        // Allows Cells to reorder:
        cell.showsReorderControl = true
        
        // returns the cell
        return cell
    }

    
    
    
    
    /* -------     ROW FUNCTIONALITY     ------- */
    // SELECTS ROW
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // assigns the selectedSection to the current selected row
        selectedSection = Section.sections[indexPath.row]
        
        // removes the selection view and reloads the table data to populate the checkmark
        tableView.deselectRow(at: indexPath, animated: true)
        tableView.reloadData()
        
        // Peform unwind segue, go back to Add New Goal screen with selected section
        self.performSegue(withIdentifier: "sectionSelectedSegue", sender: self)
    }

    // REARRANGES ROWS
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        // Grab the Section you want to move while removing it
        let movedSection = Section.sections.remove(at: fromIndexPath.row)
        
        // Insert the goal into the Ending section in the ending position
        Section.sections.insert(movedSection, at: to.row)
        
        // Save changes to Phone
        Section.saveSections()
    }
    
    // ALLOWS EDITING - DELETION
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    // DELETES ROW
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Create a message to alert the user
            var messageToUser = ""
            
            // Get the number of goals in the selected section
            let goalsListAmount = Section.sections[indexPath.row].goals.count
            
            // Checks if the goals is greater than 1 to make "goal" plural
            if (goalsListAmount > 1) {
                messageToUser = "Are you sure? If you delete this section, then it's \(goalsListAmount) goals will be deleted too."
            // Checks if the goals is equal to 1 to make "goal" singular
            } else if (goalsListAmount == 1) {
                messageToUser = "Are you sure? If you delete this section, then it's \(goalsListAmount) goal will be deleted too."
            // Else, there are no goals in the list, so just confirm if they want to delete
            } else {
                messageToUser = "Are you sure you want to delete this section?"
            }
            
            // Create the alert
            let alert = UIAlertController(title: "Delete Section", message: messageToUser, preferredStyle: .alert)
            
            // Adds the Cancel Action to the Alert
            alert.addAction(UIAlertAction(title: "CANCEL", style: .cancel, handler: { (_) in
                // does nothing
            }))
            
            // Adds the Delete Action to the Alert
            alert.addAction(UIAlertAction(title: "DELETE", style: .default, handler: { (_) in
                // Removes the section from the sections array
                Section.sections.remove(at: indexPath.row)
                
                // Deletes the row from the table
                tableView.deleteRows(at: [indexPath], with: .automatic)
                
                // Save changes to Phone
                Section.saveSections()
            }))
            
            // Shows the alert
            self.present(alert, animated: true, completion: nil)

        }
    }
}
