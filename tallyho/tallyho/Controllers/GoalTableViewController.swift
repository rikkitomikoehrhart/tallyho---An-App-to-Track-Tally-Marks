//
//  GoalTableViewController.swift
//  tallyho
//
//  Created by Rikki Tomiko Ehrhart on 4/19/24.
//

import UIKit

class GoalTableViewController: UITableViewController {

    
    /*
    ***************     LOCAL VARIABLES     ***************
                                                         */
    var goal: Goal
    
    
    
    
    /*
    ***************     OUTLETS     ***************
                                                 */
    
    @IBOutlet var iconLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var tallyTotalLabel: UILabel!
    
    
    
    
    
    
    
    /*
    ***************     LOCAL INITIALIZERS     ***************
                                                            */
    init?(coder: NSCoder, goal: Goal?) {
        self.goal = goal!
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    
    
    
    
    /*
    ***************     LOADS AND LOADING     ***************
                                                           */
    override func viewDidLoad() {
        super.viewDidLoad()

        // This sets the background of the table view to the orange and blue gradient background image
        tableView.backgroundView = UIImageView(image: UIImage(named: "BlueGreenBackground"))

        
        
        // Removes the footer
        tableView.tableFooterView = nil

        // Populates the screen
        updateUI()
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }

    
    

    
    /*
    ***************     APPEARANCE     ***************
                                                    */
    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        // Sets the section header to white and adds a top padding
        if let headerView = view as? UITableViewHeaderFooterView {
            headerView.textLabel?.textColor = .white
            tableView.sectionHeaderTopPadding = 15.0
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0
    }

    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0
    }
    
    
    /*
    ***************     POPULATE SCREEN     ***************
                                                         */
    func updateUI() {
        title = goal.name
        iconLabel.text = "\(goal.icon)"
        descriptionLabel.text = goal.description
        tallyTotalLabel.text = "\(goal.tallys)"
    }
    
    
}
