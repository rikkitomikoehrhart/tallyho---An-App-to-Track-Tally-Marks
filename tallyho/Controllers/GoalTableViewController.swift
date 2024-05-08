//
//  GoalTableViewController.swift
//  tallyho
//
//  Created by Rikki Tomiko Ehrhart on 4/19/24.
//

import UIKit
import Foundation

class GoalTableViewController: UITableViewController, AddGoalTableViewControllerDelegate {

    /* -------     OUTLETS AND VARIABLES     ------- */
    var goal: Goal
    var sectionIndex: Int
    
    @IBOutlet var iconLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var tallyTotalLabel: UILabel!
    @IBOutlet var multiplerLabel: UILabel!
    
    
    
    
    
    /* -------       LOCAL INITIALIZERS     ------- */
    init?(coder: NSCoder, goal: Goal?) {
        // Grabs the selected goal from the list
        self.goal = goal!
        self.sectionIndex = 0
        // Get the index for the above goal
        for sectionI in (0 ... (Section.sections.count - 1)) {
            // Checks the current list of goals has any number in it:
            if (Section.sections[sectionI].goals.count > 0) {
                for goalI in (0 ... (Section.sections[sectionI].goals.count - 1)) {
                    // If the current goal is in the goal list of the current section being looped through
                    if (Section.sections[sectionI].goals[goalI].name == goal!.name) {
                        // Set the sectionIndex to the index being looped through
                        self.sectionIndex = sectionI
                    }
                }
            }
        }
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    
    
    
    /* -------     LOADS AND LOADING     ------- */
    // VIEW DID LOAD
    override func viewDidLoad() {
        super.viewDidLoad()

        // This sets the background of the table view to the orange and blue gradient background image
        tableView.backgroundView = UIImageView(image: UIImage(named: "BlueGreenBackground"))

        // Populates the screen
        updateUI()
        
        // Save changes to Phone
        Section.saveSections()
    }
    
    // VIEW WILL APPEAR
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Populates the Screen
        updateUI()
        
        // Save changes to Phone
        Section.saveSections()
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
    
    // Changes the footer seciton height to 0
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0
    }

    // Changes the header section height to 0
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0
    }
    
    
    
    
    
    /* -------     ACTIONS AND FUNCTIONS     ------- */
    // UPDATEUI FUNCTION - updates the UI with the current goal's data
    func updateUI() {
        // Update all the labels
        title = goal.name
        iconLabel.text = "\(goal.icon)"
        descriptionLabel.text = goal.description
        tallyTotalLabel.text = "\(goal.tallys)"
        multiplerLabel.text = "\(goal.multiplier)"
        
    }
    
    // Updates current screen goal with the updated goal from the edit screen
    func sendUpdatedGoal(goal: Goal) {
        self.goal = goal
        
        // Save changes to Phone
        Section.saveSections()
    }
    
    // Adds to Tally
    @IBAction func upButtonPressed(_ sender: Any) {
        // Add to Tally
        goal.addition()
        
        // Update UI
        updateUI()
        
        // Save Goal
        saveGoal()
        
        // Save changes to Phone
        Section.saveSections()
    }
    
    // Sutracts from Tally
    @IBAction func downButtonPressed(_ sender: Any) {
        // Subtract from Tally
        goal.subtraction()
        
        // Update UI
        updateUI()
        
        // Save Goal
        saveGoal()
        
        // Save changes to Phone
        Section.saveSections()
    }
    
    // Save Goal
    func saveGoal() {
        // Declare index varibles
        var secIndex: Int = 0
        var goalIndex: Int = 0
        
        // Find section and goal indexes
        for sInd in (0 ... (Section.sections.count - 1)) {
            for gInd in (0 ... (Section.sections[sInd].goals.count - 1)) {
                if (goal.name == Section.sections[sInd].goals[gInd].name) {
                    secIndex = sInd
                    goalIndex = gInd
                }
            }
        }
        
        // Update Tallys:
        Section.sections[secIndex].goals[goalIndex].tallys = goal.tallys
        
    }
    
    
    
    
    
    /* -------     SEGUES AND UNWINDS     ------- */
    // PREPARE FOR SEGUE - To Select Add New Goal -- to Edit Goal
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let editScreen = segue.destination as! AddGoalTableViewController
        
        // Changes editScreen title to "Edit Goal"
        editScreen.title = "Edit Goal"
        editScreen.goal = self.goal
        editScreen.delegate = self
        editScreen.selectedSection = Section.sections[sectionIndex]
        
        // Save changes to Phone
        Section.saveSections()
    }
    
    // SEGUE ACTION
    @IBSegueAction func editGoal(_ coder: NSCoder, sender: Any?) -> AddGoalTableViewController {
        // Save changes to Phone
        Section.saveSections()
        
        return AddGoalTableViewController(coder: coder, goal: goal, section: Section.sections[sectionIndex])!
    }
    
    // UNWIND - From Add/Edit Goal Screen
    @IBAction func unwindFromAddEditGoal(unwindSegue: UIStoryboardSegue) {
        // Save changes to Phone
        Section.saveSections()
    }
    
    
}
