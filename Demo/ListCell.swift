//
//  ListCell.swift
//  Demo
//
//  Created by admin on 30/08/2022.
//

import UIKit

class ListCell: UITableViewCell {
    @IBOutlet weak var lbtext: UILabel!
    
   
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
