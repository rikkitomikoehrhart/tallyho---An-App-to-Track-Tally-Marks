//
//  GoalsTableViewCell.swift
//  tallyho
//
//  Created by Rikki Tomiko Ehrhart on 4/5/24.
//

import UIKit

class GoalsTableViewCell: UITableViewCell {

    // OUTLETS
    
    @IBOutlet var iconLabel: UILabel!
    @IBOutlet var goalTitleLabel: UILabel!
    @IBOutlet var tallyLabel: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func update(with goal: Goal) {
        iconLabel.text = String(goal.icon)
        goalTitleLabel.text = goal.name
        tallyLabel.text = String(goal.tallys)
    }
    
    
}
