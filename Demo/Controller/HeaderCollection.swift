//
//  HeaderCollection.swift
//  Demo
//
//  Created by admin on 29/08/2022.
//

import UIKit


class HeaderCollection: UICollectionReusableView {
   
    @IBOutlet weak var btShowAll: UIButton!
    @IBOutlet weak var lbDescription: UILabel!
    
    var onClickedSeeMore: (() -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        setupBtShowAll()
        
    }
    public func setupBtShowAll(){
        btShowAll.addTarget(self, action: #selector(tapOnShow), for: .touchUpInside)
    }
    @objc func tapOnShow(_ sender: Any?){
        onClickedSeeMore?()
        
    }
    
    
}
