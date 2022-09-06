//
//  JobsCell.swift
//  Demo
//
//  Created by admin on 06/09/2022.
//

import UIKit

class JobsCell: UITableViewCell {
    
    @IBOutlet  private weak var lbJobtitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
//        self.layer.cornerRadius = 20
//        self.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
//        self.layer.masksToBounds = true
//        
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    func updateUI(_ job: Jobs){
        lbJobtitle.text = job.jobTitle
    }

}
