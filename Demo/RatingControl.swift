//
//  RatingControl.swift
//  Demo
//
//  Created by admin on 25/08/2022.
//

import UIKit

@IBDesignable
class RatingControl: UIStackView {
    
    @IBInspectable var count: Int = 0 {
        didSet {
            updateStarCount()
        }
    }
    
    private let maxCount: Int = 10
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addStars()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        addStars()
    }
    
    private func addStars() {
        self.arrangedSubviews.forEach {
            self.removeArrangedSubview($0)
            $0.removeFromSuperview()
        }
        for _ in 1...maxCount {
            let starImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 16, height: 16))
            self.addArrangedSubview(starImageView)
        }
    }
    
    private func updateStarCount() {
        for i in 0..<self.arrangedSubviews.count {
            let subView = self.arrangedSubviews[i] as? UIImageView
            subView?.image = i < count ? UIImage(named: "star") : nil
        }
    }
}
