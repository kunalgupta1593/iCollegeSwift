//
//  TaxiTableViewCell.swift
//  iCollegeSwift
//
//  Created by Kunal Gupta on 18/07/16.
//  Copyright © 2016 Kunal Gupta. All rights reserved.
//

import UIKit

class TaxiTableViewCell: UITableViewCell {

   
    @IBOutlet weak var labelTaxiName: UILabel!
    @IBOutlet weak var labelNoReviews: UILabel!
    
    @IBOutlet weak var viewRatng: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func actionBtnPhone(sender: AnyObject) {
        
    }
}
