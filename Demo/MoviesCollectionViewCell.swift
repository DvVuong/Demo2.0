//
//  MoviesCollectionViewCell.swift
//  Demo
//
//  Created by admin on 24/08/2022.
//

import UIKit
import Kingfisher

class MoviesCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet private weak var imgMovie: UIImageView!
    @IBOutlet private weak var lbvoteaverage: UILabel!
    @IBOutlet private weak var lbNameMovie: UILabel!
    @IBOutlet private weak var view: UIView!
    @IBOutlet private weak var ratingControl: RatingControl!
 
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        imgMovie.contentMode = .scaleToFill
        lbNameMovie.numberOfLines = 0
        lbNameMovie.textAlignment = NSTextAlignment.left
    }
    
    func updateUI(_ movie: Movie) {
        lbNameMovie.text = movie.title
        lbvoteaverage.text = "\(movie.voteaverage)"
        let url = URL(string: "https://image.tmdb.org/t/p/w500" + movie.posterpath)
        imgMovie.kf.setImage(with: url)
        ratingControl.count = Int(movie.voteaverage)
    }
}
