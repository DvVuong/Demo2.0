//
//  requirementCell.swift
//  Demo
//
//  Created by admin on 06/09/2022.
//

import UIKit

class requirementCell: UITableViewCell {
    @IBOutlet weak var lbrequirement: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        lbrequirement.numberOfLines = 0
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
