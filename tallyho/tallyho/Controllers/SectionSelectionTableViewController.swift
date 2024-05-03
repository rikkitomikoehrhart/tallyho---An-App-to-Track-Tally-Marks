//
//  SectionSelectionTableViewController.swift
//  tallyho
//
//  Created by Rikki Tomiko Ehrhart on 5/3/24.
//

import UIKit

class SectionSelectionTableViewController: UITableViewController {
    
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

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    
    
    
    /*
    ************************************       TABLE ROWS      ************************************
                                                                                                 */
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return Section.sections.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "sectionRow", for: indexPath) as! SectionTableViewCell
        
        // Grabs the current section
        let section = Section.sections[indexPath.row]

        // Configure the cell
        cell.update(with: section)

        // Sets the background of the cell to be opaque white
        cell.backgroundColor = UIColor(ciColor: CIColor(red: 255, green: 255, blue: 255, alpha: 0.25))
        
        // Allows Cells to reorder:
        cell.showsReorderControl = true

        return cell
    }

    
    
    /*
    ******************************       ACTIONS AND FUNCTIONS      *******************************
                                                                                                 */
    
    
    

    
    
    
    /*
    ********************************       SEGUES AND UNWINDS      ********************************
                                                                                                 */
    // Unwind from Add New Section screen to the Section Selection screen
    @IBAction func unwindSaveToSectionSelection(unwindSegue: UIStoryboardSegue) {
        
    }
    
    
    
}
