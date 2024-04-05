//
//  GoalsTableViewController.swift
//  tallyho
//
//  Created by Rikki Tomiko Ehrhart on 4/5/24.
//

import UIKit

class GoalsTableViewController: UITableViewController {
    
    
    // Test Sample Goals
    var workSection = Section(name: "Work", goals: [
        Goal(name: "Contracts in 2024", description: "How many Contracts we've gotten in 2024", tallys: 4, icon: "💼"),
        Goal(name: "Lunches with Clients", description: "How many times we've gone out for lunches with clients in 2024", tallys: 32, icon: "🍲")
    ])
    var homeSection = Section(name: "Home", goals: [
        Goal(name: "Perfect Nights Sleep", description: "Days with perfect nights sleep", tallys: 0, icon: "😴"),
        Goal(name: "Cook Dinner", description: "Cooked dinner instead of going out", tallys: 42, icon: "👩‍🍳"),
        Goal(name: "Play with Dog", description: "Times played with dog!", tallys: 96, icon: "J")
    ])
    var selfCareSection = Section(name: "Self-Care", goals: [
        Goal(name: "Meditation Minutes", description: "Minutes Meditating in 2024", tallys: 1_234, icon: "🧘‍♀️"),
        Goal(name: "Daily Vegetables", description: "Days where I ate at least 5 servings of fruits or vegetables a day", tallys: 45, icon: "🥦"),
        Goal(name: "Video Game Hours", description: "Hours I've played video games in 2024", tallys: 42, icon: "🎮"),
        Goal(name: "Date Nights", description: "Date nights with hubby!", tallys: 12, icon: "💕")
    ])
    var communitySection = Section(name: "Community", goals: [
        Goal(name: "Participants", description: "How many participents in the Community activity", tallys: 153, icon: "P")
    ])
    var sections: [Section] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Test Sample Section
        sections = [workSection, homeSection, selfCareSection, communitySection]
        
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        
        
        
        // This sets the background of the table view to the orange and blue gradient background image
        tableView.backgroundView = UIImageView(image: UIImage(named: "orangebluebackground"))
        
    }
    
    
    
    // Populates the number of sections
    override func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }

    // Populates the number of rows in a section
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].goals.count
    }

    
    // Populates the cells
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "GoalCell", for: indexPath)
        
        // Grabs the current goal
        let goal = sections[indexPath.section].goals[indexPath.row]
        
        // Grabs the goal icon and sets a fixed width
        let goalIcon = String(goal.icon).padding(toLength: 5, withPad: " ", startingAt: 0)
        
        // Sets the content for the cell
        var content = cell.defaultContentConfiguration()
        content.text = "\(goalIcon) \(goal.name)"
        content.secondaryText = "\(goal.tallys)"
        
        // Sets the cell's content
        cell.contentConfiguration = content
        
        // Sets the background of the cell to be opaque white
        cell.backgroundColor = UIColor(ciColor: CIColor(red: 255, green: 255, blue: 255, alpha: 0.25))

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
