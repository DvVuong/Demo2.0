//
//  EditViewController.swift
//  Demo
//
//  Created by admin on 31/08/2022.
//

import UIKit
protocol EditDelegate {
    func editfruit(edit: Fruit, dem: Any )
    
}

class EditViewController: UIViewController {
    @IBOutlet private weak var tfInput: UITextField!
    @IBOutlet private weak var button: UIButton!
    var fruit: Fruit!
    var edfruit = [Fruit]()
    var delegate: EditDelegate?
    var index: Int?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setuptf()
        setuptBt()
        print(index)
    }
    private func setuptf(){
        tfInput.text = fruit.name
        tfInput.delegate = self
    }
    private func setuptBt(){
        button.addTarget(self, action: #selector(tapOnupdate), for: .touchUpInside)
    }
    @objc func tapOnupdate(){
        dismiss(animated: true)
    }
}
extension EditViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == tfInput {
            let fruitEdit = Fruit(name: tfInput.text!)
            delegate?.editfruit(edit: fruitEdit, dem: index)
            //print(fruitEdit)
        }
    }
}
