//
//  DistrictsTableViewCell.swift
//  Demo
//
//  Created by admin on 23/08/2022.
//

import UIKit

class DistrictsTableViewCell: UITableViewCell {
    @IBOutlet weak var lbDistricts: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        lbDistricts.textAlignment = NSTextAlignment.left
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
