//
//  SectionTableViewCell.swift
//  tallyho
//
//  Created by Rikki Tomiko Ehrhart on 5/3/24.
//

import UIKit

class SectionTableViewCell: UITableViewCell {

    /* -------     OUTLETS AND VARIABLES     ------- */
    @IBOutlet var sectionTitleLabel: UILabel!
    @IBOutlet var goalTotalLabel: UILabel!
    
    
    

    
    /* -------     TABLE CELL FUNCTIONS     ------- */
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    
    
    
    
    /* -------     UPDATE FUNCTION     -------*/
    func update(with section: Section) {
        sectionTitleLabel.text = section.name
        goalTotalLabel.text = String(section.goals.count)
    }

}
