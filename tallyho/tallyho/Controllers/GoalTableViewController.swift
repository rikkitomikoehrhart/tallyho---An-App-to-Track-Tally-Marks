//
//  GoalTableViewController.swift
//  tallyho
//
//  Created by Rikki Tomiko Ehrhart on 4/19/24.
//

import UIKit

class GoalTableViewController: UITableViewController {

    /* -------     OUTLETS AND VARIABLES     ------- */
    var goal: Goal
    
    @IBOutlet var iconLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var tallyTotalLabel: UILabel!
    @IBOutlet var multiplerLabel: UILabel!
    
    
    
    
    
    /* -------       LOCAL INITIALIZERS     ------- */
    init?(coder: NSCoder, goal: Goal?) {
        self.goal = goal!
        super.init(coder: coder)
    }
    
    // REQUIRED init
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
    }
    
    // VIEW WILL APPEAR
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // reloads table data
        tableView.reloadData()
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
        title = goal.name
        iconLabel.text = "\(goal.icon)"
        descriptionLabel.text = goal.description
        tallyTotalLabel.text = "\(goal.tallys)"
        multiplerLabel.text = "\(goal.multiplier)"
    }
    
    // When the edit button is pressed - send current goal's information to the Add New button screen
    @IBAction func editButtonPressed(_ sender: UIBarButtonItem) {
        print("Edit Pressed")
        
    }
    
    
    
    
    
}
