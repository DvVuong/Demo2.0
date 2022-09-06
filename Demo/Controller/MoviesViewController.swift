//
//  MoviesViewController.swift
//  Demo
//
//  Created by admin on 24/08/2022.
//

import UIKit
import Kingfisher
import SwiftUI


class MoviesViewController: UIViewController {
    @IBOutlet private weak var collectionview: UICollectionView!
    var movies = [Movie]()
    var newMovie = [Movie]()
    var didselecMovie: ((Movie) ->Void)?
    var expand = true
    var buttonCounter = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        //setupcollectionview()
        getDataApi()
        setupcollectionview()
    }
    private func getDataApi(){
        
        //       DispatchQueue.global().async {//
        //           guard let url = URL(string: "https://api.themoviedb.org/3/discover/movie?api_key=4e4ef9a58cbb994af3e8b095b1d5036a&language=en-US&sort_by=popularity.desc&include_adult=false&include_video=false&page=1&with_watch_monetization_types=flatrate") else {
        //               return
        //           }
        //           guard let data = try? Data(contentsOf: url), let json = try? JSONDecoder().decode(movieApi.self, from: data) else {
        //               return
        //           }
        //           self.movies = json.results
        //           DispatchQueue.main.async {
        //               self.collectionview.reloadData()
        //           }
        //       }
        let url = URL(string: "https://api.themoviedb.org/3/discover/movie?api_key=4e4ef9a58cbb994af3e8b095b1d5036a&language=en-US&sort_by=popularity.desc&include_adult=false&include_video=false&page=1&with_watch_monetization_types=flatrate")
        URLSession.shared.dataTask(with: url!) { data, response, error in
            guard let data = data, error == nil else {
                return
            }
            do {
                let json = try  JSONDecoder().decode(MoviesResponse.self, from: data)
                self.movies = json.results
                self.newMovie = json.results
                //print(self.movies)
                DispatchQueue.main.async {
                    self.collectionview?.reloadData()
                }
            }
            catch {
                print(error)
            }
        }.resume()
    }
    private func setupcollectionview(){
        collectionview.delegate = self
        collectionview.dataSource = self
        if let flowLayout = collectionview.collectionViewLayout as? UICollectionViewFlowLayout {// lấy layout của collectionview(mỗi một collectionview chỉ sinh ra 1 collectionviewlayout duy nhất)
           flowLayout.minimumInteritemSpacing  = 20
           flowLayout.minimumLineSpacing = 10
           let numberOfRow:CGFloat = 2
           let totalwidth = (collectionview.frame.width - 0.1)
           let width = (totalwidth - 32  - (numberOfRow - 1) * flowLayout.minimumInteritemSpacing)  / 2
            flowLayout.itemSize = CGSize(width: width, height: 400)
            flowLayout.sectionInset = UIEdgeInsets(top: 0, left: 32, bottom: 0, right: 32)
        }
        let nib = UINib(nibName: "MoviesCollectionViewCell", bundle: nil)
        collectionview?.register(nib, forCellWithReuseIdentifier: "MoviesCell")
        // resgister Header
        let header = UINib(nibName: "HeaderCollection", bundle: nil)
        collectionview.register(header, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "headerCell")
        // register Footer
        let footer = UINib(nibName: "FooterCollection", bundle: nil)
        collectionview.register(footer, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: "footerCell")
    }
}
extension MoviesViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
//        if section == 0{
//
//        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionview.dequeueReusableCell(withReuseIdentifier: "MoviesCell", for: indexPath) as! MoviesCollectionViewCell
//        if indexPath.section == 0 {
////            let cell = collectionview.dequeueReusableCell(withReuseIdentifier: "MoviesCell", for: indexPath) as! MoviesCollectionViewCell
            cell.updateUI(movies[indexPath.item])
            //return cell
           // print(indexPath.section)
//        }
//        if indexPath.section == 1 {
//            cell.lbNameMovie.text = " asdasdasd"
//            cell.imgMovie.isHidden = true
//            cell.backgroundColor = .yellow
//        }
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "headerCell", for: indexPath) as! HeaderCollection
            header.lbDescription.text = "Movies"
            header.lbDescription.backgroundColor = .blue
            header.onClickedSeeMore = {
                
            }
            return header
        case UICollectionView.elementKindSectionFooter:
            let footer = collectionview.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "footerCell", for: indexPath) as! FooterCollection
            footer.lbFooter.text = "Footer"
            footer.lbFooter.backgroundColor = .blue
            return footer
        default:
            return UICollectionReusableView()
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionview.frame.width, height: 50)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return CGSize(width: collectionview.frame.width, height: 50)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if (indexPath.section == 0) {
            self.buttonCounter += 1
            if self.buttonCounter % 2 != 0 {
                self.expand = true
                self.movies.remove(at: indexPath.section)
                print(indexPath.section)
                collectionView.reloadData()
                print("true")
            }else{
//                    self.movies.append(contentsOf: self.newMovie)
//                    collectionView.reloadData()
                print("false")
            }
            print("section1 \(indexPath.item)")
        }else{
            print("section2 \(indexPath.item)")
        }
        collectionView.deselectItem(at: indexPath, animated: true)
        //movies[indexPath.section].isOpen = !movies[indexPath.section].isOpen
        //collectionView.reloadSections([indexPath.section])
        
    }
}

//extension MoviesViewController: UICollectionViewDelegateFlowLayout {
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//
//        let totalWitdh = collectionView.frame.width - 0.1
//        let numOfItemAtRow: CGFloat = 2
//        let sectionInsets = self.collectionView(collectionView, layout: collectionViewLayout, insetForSectionAt: indexPath.section)
//        let interSpacing = self.collectionView(collectionView, layout: collectionViewLayout, minimumInteritemSpacingForSectionAt: indexPath.section)// khoảng cách theo hàng
//        let witdh = (totalWitdh - sectionInsets.right - sectionInsets.right - (numOfItemAtRow - 1)*interSpacing) / numOfItemAtRow
//
//       return CGSize(width: witdh, height: 400)
//  }
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        return 16.0
//    }
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
//        return 16.0
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//        if section == 0 {
//            return .zero
//        }
//        return UIEdgeInsets(top: 32, left: 32, bottom: 32, right: 32)
//    }
//}
