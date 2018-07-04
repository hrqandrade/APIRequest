//
//  FirstViewCarsTableViewCell.swift
//  HenriqueAS_WebMotors
//
//  Created by Henrique Silva on 24/06/2018.
//  Copyright © 2018 Henrique Silva. All rights reserved.
//

import UIKit

class FirstViewCarsTableViewCell: UITableViewCell {

    @IBOutlet weak var makeLabel: UILabel!
    @IBOutlet weak var modelLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var imageCarView: UIImageView!
    
    @IBOutlet weak var versionLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
