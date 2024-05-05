//
//  GoalsTableViewController.swift
//  tallyho
//
//  Created by Rikki Tomiko Ehrhart on 4/5/24.
//

import UIKit

class GoalsTableViewController: UITableViewController {
    
    /* -------     OUTLETS AND VARIABLES     ------- */
    var goal: Goal?
    
    
    
    
    
    /* -------       LOADS AND LOADING     ------- */
    // VIEW DID LOAD
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // This sets the background of the table view to the orange and blue gradient background image
        tableView.backgroundView = UIImageView(image: UIImage(named: "BlueGreenBackground"))
    
        
        // Adds Edit Button to Nav Bar
        navigationItem.leftBarButtonItem = editButtonItem
        navigationItem.leftBarButtonItem?.tintColor = UIColor.white
        
    }
    
    // VIEW WILL APPEAR
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // reloads table data
        tableView.reloadData()
    }
    
    
    
    
    
    /* -------     TABLE SECTIONS     ------- */
    // POPULATES THE NUMBER OF SECTIONS IN A TABLE
     override func numberOfSections(in tableView: UITableView) -> Int {
        // Returns the number of sections to populate
         return Section.sections.count
    }
    
    // POPULATES SECTION TITLES
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        // Sets the section titles to the section names
        return Section.sections[section].name
    }
    
    
    
    
    
    /* -------       TABLE ROWS     ------- */
    // POPULATES TJE NUMBER OF ROWS PER SECTION
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Section.sections[section].goals.count
    }
    
    // FILLS OUT THE INFORMATION IN EACH ROW CELL
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "GoalCell", for: indexPath) as! GoalsTableViewCell
        
        // Grabs the current goal
        let goal = Section.sections[indexPath.section].goals[indexPath.row]
        
        // Configure the cell
        cell.update(with: goal)
        
        // Sets the background of the cell to be opaque white
        cell.backgroundColor = UIColor(ciColor: CIColor(red: 255, green: 255, blue: 255, alpha: 0.25))
        
        // Allows Cells to reorder:
        cell.showsReorderControl = true

        return cell
    }
    
    
    
    
    
    /* -------     APPEARANCE     ------- */
    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        // Sets the section header to white and adds a top padding
        if let headerView = view as? UITableViewHeaderFooterView {
            // Changes the text color to white
            headerView.textLabel?.textColor = .white
            
            // Adds top padding
            tableView.sectionHeaderTopPadding = 15.0
        }
    }


    
    

    /* -------     ROW FUNCTIONALITY     ------- */
    // SELECTS THE ROW
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        goal = Section.sections[indexPath.section].goals[indexPath.row]
    }
    
    // MOVES THE ROW
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        // Grab the starting section
        var fromSection = Section.sections[fromIndexPath.section]
        
        // Grab the goal you want to move while removing it
        let movedGoal = fromSection.goals.remove(at: fromIndexPath.row)
        
        // Grab the Ending section
        var toSection = Section.sections[to.section]
        
        // Insert the goal into the Ending section in the ending position
        toSection.goals.insert(movedGoal, at: to.row)
    }
    
    // ALLOWS EDITING THE ROWS -- DELETING
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    // DELETES THE ROWS
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // If deleting - get the sections list of goals
            var sectionGoals = Section.sections[indexPath.section].goals
            
            // Remove the selected goal from that specific list
            sectionGoals.remove(at: indexPath.row)
            
            // Delete the row from the table
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }

    
    
    
 
    /* -------     ACTIONS AND FUNCTIONS     ------- */
    @IBAction func addButtonTapped(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "addNewGoalSegue", sender: sender)
    }
    
    
    
    
    
    /* -------     SEGUES AND UNWINDS     ------- */
    // SEGUE - Goes to Goal Screen - sending the data for the currently selected goal
    @IBSegueAction func goToGoalScreen(_ coder: NSCoder, sender: Any?) -> GoalTableViewController? {
        var selectedGoal: Goal?
        
        if let cell = sender as? UITableViewCell, let indexPath = tableView.indexPath(for: cell) {
            selectedGoal = Section.sections[indexPath.section].goals[indexPath.row]
        }
        
        
        return GoalTableViewController(coder: coder, goal: selectedGoal)
    }
    
    // UNWIND - From Add New Goal back to Goals List
    @IBAction func unwindSaveToGoalsList(unwindSegue: UIStoryboardSegue) {}
    
    
    
    
    
    
    
    
    
    
    
    
}
