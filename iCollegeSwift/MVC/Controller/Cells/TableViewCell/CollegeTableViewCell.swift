//
//  CollegeTableViewCell.swift
//  iCollegeSwift
//
//  Created by cbl20 on 6/24/16.
//  Copyright © 2016 Kunal Gupta. All rights reserved.
//

import UIKit

class CollegeTableViewCell: UITableViewCell {

    @IBOutlet weak var labelCollegeName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(aselected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
