//
//  GoalsTableViewController.swift
//  tallyho
//
//  Created by Rikki Tomiko Ehrhart on 4/5/24.
//

import UIKit

class GoalsTableViewController: UITableViewController {
    
    
    
    
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
    
        
        // Adds Edit Button to Nav Bar
        navigationItem.leftBarButtonItem = editButtonItem
        navigationItem.leftBarButtonItem?.tintColor = UIColor.white
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    
    
    
    /*
    ******************************       POPULATES THE SECTIONS       *****************************
                                                                                                 */
     override func numberOfSections(in tableView: UITableView) -> Int {
        // Returns the number of sections to populate
         return Section.sections.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        // Sets the section titles to the section names
        return Section.sections[section].name
    }
    
    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        // Sets the section header to white and adds a top padding
        if let headerView = view as? UITableViewHeaderFooterView {
            headerView.textLabel?.textColor = .white
            tableView.sectionHeaderTopPadding = 15.0
        }
    }


    
    
    
    /*
    ********************************       POPULATES THE ROWS       *******************************
                                                                                                 */
    // Returns the number of sections
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Section.sections[section].goals.count
    }
    
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
    
    /*
    *********************************       SELECTS THE ROWS       ********************************
                                                                                                 */
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let goal = Section.sections[indexPath.section].goals[indexPath.row]
    }
    
    
    /*
    ******************************       EDIT/DELETES THE ROWS       ******************************
                                                                                                 */
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
    
    
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            var sectionGoals = Section.sections[indexPath.section].goals
            sectionGoals.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }

    
    
    
 
    
    
    
    
    /*
    ********************************       SEGUES & ACTIONS       *********************************
                                                                                                 */
        
    @IBSegueAction func goToGoalScreen(_ coder: NSCoder, sender: Any?) -> GoalTableViewController? {
        var selectedGoal: Goal?
        
        if let cell = sender as? UITableViewCell, let indexPath = tableView.indexPath(for: cell) {
            selectedGoal = Section.sections[indexPath.section].goals[indexPath.row]
        }
        
        
        return GoalTableViewController(coder: coder, goal: selectedGoal)
    }
    
    

    
    
    @IBAction func addButtonTapped(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "addNewGoalSegue", sender: sender)
    }
    
    
    
    @IBAction func unwindSaveToGoalsList(unwindSegue: UIStoryboardSegue) {}
    
    
    
    
    
    
    
    
    
    
    
    
}
