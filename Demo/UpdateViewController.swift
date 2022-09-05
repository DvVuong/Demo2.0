//
//  UpdateViewController.swift
//  Demo
//
//  Created by admin on 30/08/2022.
//

import UIKit

protocol UpdateDelegate {
    func addNewfruit(newFruit: Fruit)
}

class UpdateViewController: UIViewController {
    @IBOutlet private weak var tfInput: UITextField!
    @IBOutlet private weak var btUpdate: UIButton!
    
    
    var delegate: UpdateDelegate?
    var arrfruit = [Fruit]()
    var newFruit = [Fruit]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupTfinput()
        setUpbt()
        
    }
    private func setupTfinput(){
        tfInput.attributedPlaceholder = NSAttributedString(string: "Add Newfruit", attributes: [NSAttributedString.Key.foregroundColor : UIColor.black])
        tfInput.font = UIFont.systemFont(ofSize: 20)
        
    }
    
    private func setUpbt(){
        btUpdate.addTarget(self, action: #selector(tapOnAdd), for: .touchUpInside)
    }
    @objc func tapOnAdd(){
        let fruit = Fruit(name: tfInput.text!)
        SessionData.share.newfruit = fruit
        delegate?.addNewfruit(newFruit: fruit)
        dismiss(animated: true)
    }
    

  

}
