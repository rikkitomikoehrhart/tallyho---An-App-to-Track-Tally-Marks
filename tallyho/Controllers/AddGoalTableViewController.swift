//
//  AddGoalTableViewController.swift
//  tallyho
//
//  Created by Rikki Tomiko Ehrhart on 4/5/24.
//

import UIKit
import Foundation

protocol AddGoalTableViewControllerDelegate : NSObjectProtocol {
    // Send Data
    func sendUpdatedGoal(goal: Goal)
}

class AddGoalTableViewController: UITableViewController {
    /* -------     DELEGATES     ------- */
    weak var delegate : (AddGoalTableViewControllerDelegate)?
    
    
    
    
    /* -------     OUTLETS AND VARIABLES     ------- */
    var goal: Goal?
    var sections: [Section] = []
    var selectedSection: Section?
    
    @IBOutlet var selectASectionLabel: UILabel!
    
    
    @IBOutlet var goalNameTextField: UITextField!
    @IBOutlet var descriptionTextView: UITextView!
    @IBOutlet var emojiInitialTextField: UITextField!
    @IBOutlet var tallyAmountTextField: UITextField!
    @IBOutlet var multiplierTextField: UITextField!
    
    
    
    
    
    /* -------     INITIALIZERS     ------- */
    init?(coder: NSCoder, goal: Goal?, section: Section?) {
        self.goal = goal
        self.selectedSection = section
        super.init(coder: coder)
        
    }
    
    required init?(coder: NSCoder) {
        self.goal = nil
        self.selectedSection = nil
        super.init(coder: coder)
    }
    
    
    
    
    
    /* -------     LOADS AND LOADING     ------- */
    // VIEW DID LOAD
    override func viewDidLoad() {
        super.viewDidLoad()

        
        // This sets the background of the table view to the orange and blue gradient background image
        tableView.backgroundView = UIImageView(image: UIImage(named: "BlueGreenBackground"))
        
        
        // Update UI
        updateView()
        
        // Save changes to Phone
        Section.saveSections()
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

    
    
    
    /* -------     ACTIONS AND FUNCTIONS     ------- */
    // UPDATE UI
    func updateView() {
        guard let goal = goal else { return }
        guard let selectedSection = selectedSection else { return }
        
        goalNameTextField.text = goal.name
        descriptionTextView.text = goal.description
        emojiInitialTextField.text = "\(goal.icon)"
        tallyAmountTextField.text = "\(goal.tallys)"
        selectASectionLabel.text = "\(selectedSection.name)"
        multiplierTextField.text = "\(goal.multiplier)"
        
        // Save changes to Phone
        Section.saveSections()
    }
    
    
    // Validate The user inputs when the save button is tapped
    @IBAction func saveButtonTapped(_ sender: Any) {

        // Grab all the inputs
        var goalName: String
        var description: String
        var emojiInitial: Character
        var startingTally: Int
        var index: Int = 0
        var multiplier: Int
        var goalIndex: Int = 0
        
        // A changes flag:
        var changesFlag = 0
        
        // Start a message to the user
        var errorMessageToUser: String
        
        errorMessageToUser = "The following changes were made to your New Goal: \n"
        
        
        // VALIDATE THE INPUTS:
        // Goal Name
        if (goalNameTextField.text != "") {
            goalName = goalNameTextField.text!
        } else {
            goalName = "Goal"
            errorMessageToUser += "- Name: Goal\n"
            
            // Call changes flag:
            changesFlag += 1
        }
        
        // Description
        if (descriptionTextView.text != "") {
            description = descriptionTextView.text
        } else {
            description = "A Tally"
            errorMessageToUser += "- Description: A Tally\n"
            
            // Call changes flag:
            changesFlag += 1
        }
        
        // Emoji/Initial
        if (emojiInitialTextField.text != "") {
            emojiInitial = Character(String(emojiInitialTextField.text!.prefix(1)))
            if (emojiInitialTextField.text!.count > 1) {
                errorMessageToUser += "- Emoji/Initial: \(emojiInitial)\n"
                
                // Call changes flag:
                changesFlag += 1
            }
        } else {
            emojiInitial = "😀"
            errorMessageToUser += "- Emoji/Initial: 😀\n"
            
            // Call changes flag:
            changesFlag += 1
        }
        
        // Tally Amount
        if (tallyAmountTextField.text != "") {
            startingTally = Int(tallyAmountTextField.text!) ?? 0
        } else {
            startingTally = 0
            errorMessageToUser += "- Starting Tally: 0\n"
            
            // Call changes flag:
            changesFlag += 1
        }
        
        // Section
        if (selectASectionLabel.text != "Choose A Section"){
            for section in (0 ... Section.sections.count - 1) {
                if (Section.sections[section].name == selectASectionLabel.text) {
                    index = section
                }
            }
        } else {
            index = 0
            errorMessageToUser += "- Section: \(Section.sections[index].name)\n"
            
            // Call changes flag:
            changesFlag += 1
        }
        
        // Multiplier
        if (multiplierTextField.text! != "") {
            multiplier = Int(multiplierTextField.text!) ?? 1
        } else {
            multiplier = 1
            errorMessageToUser += "- Multiplier: 1\n"
            
            // Call changes flag:
            changesFlag += 1
        }
    
        
        
        
        if ((goal) != nil) {
            // EDIT GOAL SAVE
            
            // Ask user if they want to make any edits:
            errorMessageToUser += "Would you like to update your goal or make edits?"
            
            
            // VALIDATE MESSAGE:
            var messageToUser: String
            // If any changes were made
            if (changesFlag > 0 ){
                // Change the message to the error message
                messageToUser = errorMessageToUser
            } else {
                // Else, no errors, so just ask them to confirm
                messageToUser = "Update \(goalName) goal?"
            }
            
            // ASK USER TO CONFIRM
            // Create the Alert
            let alert = UIAlertController(title: "Edit Goal?", message: messageToUser, preferredStyle: .alert)
            
            //Adds the Edit Action to the Alert
            alert.addAction(UIAlertAction(title: "EDIT", style: .cancel, handler: { (_) in
                // do nothing, let the screen go back to the add new goal screen
            }))
            
            // Adds the Save button to the Alert
            alert.addAction(UIAlertAction(title: "SAVE", style: .default, handler: { [self] (_) in
                // Creates the new goal:
                let newGoal = Goal(name: goalName, description: description, tallys: startingTally, icon: emojiInitial, multiplier: multiplier)
                

                
                
                // If Section change
                if (selectedSection?.name != selectASectionLabel.text) {
                    // Find the old section's index
                    var secIndex: Int = 0
                    for sectionI in (0 ... (Section.sections.count - 1)) {
                        if (selectedSection!.name == Section.sections[sectionI].name) {
                            secIndex = sectionI
                        }
                    }
                    
                    // Find the old goal's index
                    for goalI in (0 ... (Section.sections[secIndex].goals.count - 1)) {
                        if (goal!.name == Section.sections[secIndex].goals[goalI].name) {
                            goalIndex = goalI
                        }
                    }
                    
                    
                    // Remove the goal from the old section
                    Section.sections[secIndex].goals.remove(at: goalIndex)
                    
                    // Append to new section
                    Section.sections[index].goals.append(newGoal)
                    
                    
                } else {
                    // Its the same section:
                    
                    // Finds the goal index:
                    for goalI in (0 ... (Section.sections[index].goals.count - 1)) {
                        if (goal!.name == Section.sections[index].goals[goalI].name) {
                            goalIndex = goalI
                        }
                    }
                
                    // Replace the newGoal to the selected section
                    Section.sections[index].goals[goalIndex] = newGoal
                }
                
                // Save goal as newGoal
                self.goal = newGoal
                
                // Sends updated goal back to goal screen
                if let delegate = delegate {
                    delegate.sendUpdatedGoal(goal: self.goal!)
                }
                
                // Save changes to Phone
                Section.saveSections()
                
            }))
            
            
            // Shows the alert
            self.present(alert, animated: true, completion: nil)
            
            
        } else {
            // ADD NEW GOAL SAVE
            
            
            // Ask user if they want to make any edits:
            errorMessageToUser += "Would you like to submit or make edits?"
            
            
            // VALIDATE MESSAGE:
            var messageToUser: String
            // If any changes were made
            if (changesFlag > 0 ){
                // Change the message to the error message
                messageToUser = errorMessageToUser
            } else {
                // Else, no errors, so just ask them to confirm
                messageToUser = "Add new \(goalName) goal to \(Section.sections[index].name) section?"
            }
            
            // ASK USER TO CONFIRM
            // Create the Alert
            let alert = UIAlertController(title: "Add New Goal?", message: messageToUser, preferredStyle: .alert)
            
            //Adds the Edit Action to the Alert
            alert.addAction(UIAlertAction(title: "EDIT", style: .cancel, handler: { (_) in
                // do nothing, let the screen go back to the add new goal screen
            }))
            
            // Adds the Save button to the Alert
            alert.addAction(UIAlertAction(title: "SAVE", style: .default, handler: { (_) in
                // Creates the new goal:
                let newGoal = Goal(name: goalName, description: description, tallys: startingTally, icon: emojiInitial, multiplier: multiplier)
                
                
                // Adds the newGoal to the selected section
                Section.sections[index].goals.append(newGoal)
                
                // Clear inputs
                self.goalNameTextField.text = ""
                self.descriptionTextView.text = ""
                self.emojiInitialTextField.text = ""
                self.tallyAmountTextField.text = "0"
                self.selectASectionLabel.text = "Choose A Section"
                self.multiplierTextField.text = "1"
               
                // Save changes to Phone
                Section.saveSections()
            }))
            
            
            // Shows the alert
            self.present(alert, animated: true, completion: nil)
        }
        
    }
    
    

    
    /* -------     SEGUES AND UNWINDS     ------- */
    // UNWIND - back from Select a Section Screen with Selection
    @IBAction func unwindToAddFromSelect(_ unwindSegue: UIStoryboardSegue) {
        // Save changes to Phone
        Section.saveSections()
        
        // Selects the screen
        let selectASectionScreen = unwindSegue.source as! SectionSelectionTableViewController
        
        // Tests the identifier
        if (unwindSegue.identifier == "sectionSelectedSegue") {
            // Sets the selected selected section on this page to the selected section
            let selectedSection = selectASectionScreen.selectedSection
            
            // Changes the label from "Choose A Section" to the choosen section name
            selectASectionLabel.text = selectedSection?.name
        }
        

    }
    
 
 
    
    
    
}
