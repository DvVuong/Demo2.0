//
//  ViewController.swift
//  Demo
//
//  Created by admin on 22/08/2022.
//

import UIKit
import Networking

class Cat {
    func createAnimal() -> Animal {
        return Animal()
    }
    
    fileprivate func makeSound() {
        
    }
    
    private func makeName() {
        
    }
}

class ViewController: UIViewController {
    @IBOutlet weak var lbTitle: UILabel!
    @IBOutlet weak var viewTfUser: UIView!
    @IBOutlet weak var viewtfEmail: UIView!
    @IBOutlet weak var viewPassword: UIView!
    @IBOutlet weak var viewCity: UIView!
    @IBOutlet weak var viewTfDistricts: UIView!
    @IBOutlet weak var tfUsername: UITextField!
    @IBOutlet weak var tfEmail: UITextField!
    @IBOutlet weak var tfPassword: UITextField!
    @IBOutlet weak var tfDistricts: UITextField!
    @IBOutlet weak var tfCities: UITextField!
    @IBOutlet weak var btCreateAcount: UIButton!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var viewEllipse: UIView!
    
    var codeCity = 0
    var codeDistrict = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //view.layer.compositingFilter = "luminosityBlendMode"
        let cat = Cat()
        cat.makeSound()
        
        setupViewEllipse()
        setupTfUsername()
        setupLbTitle()
        setupTfEmail()
        setupTfPassword()
        setupBtCreateAccount()
        setupTfCittes()
        setuptfDistricts()
        setupTextView()
       
        viewTfUser.layer.borderWidth = 1
        viewTfUser.layer.cornerRadius = 8
        viewTfUser.layer.masksToBounds = true
        viewTfUser.layer.borderColor = UIColor.white.cgColor
        viewtfEmail.layer.borderWidth = 1
        viewtfEmail.layer.borderColor = UIColor.white.cgColor
        viewtfEmail.layer.cornerRadius = 8
        viewtfEmail.layer.masksToBounds = true
        viewPassword.layer.borderWidth = 1
        viewPassword.layer.borderColor = UIColor.white.cgColor
        viewPassword.layer.cornerRadius = 8
        viewPassword.layer.masksToBounds = true
        viewTfDistricts.layer.borderWidth = 1
        viewTfDistricts.layer.borderColor = UIColor.white.cgColor
        viewTfDistricts.layer.cornerRadius = 8
        viewTfDistricts.layer.masksToBounds = true
        viewCity.layer.borderWidth = 1
        viewCity.layer.borderColor = UIColor.white.cgColor
        viewCity.layer.cornerRadius = 8
        viewCity.layer.masksToBounds = true
        
        //NotificationCenter.default.addObserver(self, selector: #selector(didReceiverNotification(_:)), name: NSNotification.Name("city_selected"), object: nil)
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    private func setupTextView(){
        //textView.text = "By creating an account or siging you agree to our Terms and Condititions"
        textView.textAlignment = NSTextAlignment.center
        textView.font = UIFont.systemFont(ofSize: 15)
        textView.textColor = UIColor.white
        textView.delegate = self
        textView.isScrollEnabled = false
        let attributedString = NSMutableAttributedString()
        let firstAtt = NSAttributedString(string: "By creating an account or siging you agree to our ", attributes: [.foregroundColor: UIColor.white])
        attributedString.append(firstAtt)
        let secondAtt = NSAttributedString(string: "Terms and Condititions",
                                           attributes: [.link: URL(string: "https://www.google.com/?client=safari")!])
        attributedString.append(secondAtt)
        let style = NSMutableParagraphStyle()
        style.alignment = NSTextAlignment.center
        attributedString.addAttribute(.paragraphStyle, value: style, range: NSMakeRange(0, attributedString.length))
        textView.attributedText = attributedString
        textView.linkTextAttributes = [
            .foregroundColor: UIColor.white,
            .underlineColor: UIColor.white,
            .underlineStyle: NSUnderlineStyle.single.rawValue
        ]
   
//    @objc func didReceiverNotification(_ notification: Notification) {
//
//        print(notification.object as? City)
  }
    
    private func setupViewEllipse(){
        viewEllipse.layer.cornerRadius = viewEllipse.frame.height / 2
        viewEllipse.layer.masksToBounds = true
        viewEllipse.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.2)
        viewEllipse.layer.borderWidth = 1
        viewEllipse.layer.borderColor = UIColor.white.cgColor
    }
    private func setupLbTitle(){
        lbTitle.text = "Create Account"
        lbTitle.textColor = UIColor.white
        lbTitle.textAlignment = NSTextAlignment.center
        lbTitle.font = UIFont.systemFont(ofSize: 20)
    }
    private func setupTfUsername(){
        tfUsername.placeholder = "Username"
        tfUsername.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0)
        tfUsername.attributedPlaceholder = NSAttributedString(string: "Username",attributes: [NSAttributedString.Key.foregroundColor : UIColor.white])
    }
    private func setupTfEmail(){
        tfEmail.placeholder = "Email"
//        tfEmail.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0)
        tfEmail.attributedPlaceholder = NSAttributedString(string: "Email",attributes: [NSAttributedString.Key.foregroundColor : UIColor.white])
        
    }
    private func setupTfPassword(){
        tfPassword.placeholder = "Password"
        
        tfPassword.layer.borderColor = UIColor.white.cgColor
//        tfPassword.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.1)
        tfPassword.attributedPlaceholder = NSAttributedString(string: "Password",attributes: [NSAttributedString.Key.foregroundColor : UIColor.white])
        
    }
    private func setupBtCreateAccount(){
        btCreateAcount.setTitle("Create Account", for: .normal)
        btCreateAcount.setTitleColor(UIColor.white, for: .normal)
        btCreateAcount.layer.cornerRadius = 8
        btCreateAcount.layer.masksToBounds = true
        btCreateAcount.backgroundColor = UIColor(red: 0.79, green: 0.353, blue: 0.949, alpha: 1)
        btCreateAcount.addTarget(self, action: #selector(tapOnMoveMoviesScreen), for: .touchUpInside)
    }
    @objc func tapOnMoveMoviesScreen(){
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MoviesScreen")
        vc.modalPresentationStyle = .overFullScreen
        present(vc, animated: true)
        
    }
    private func setupTfCittes(){
        tfCities.placeholder = "Cities"
        tfCities.delegate = self
        tfCities.textColor = UIColor.white
        tfCities.attributedPlaceholder = NSAttributedString(string: "Cities",attributes: [NSAttributedString.Key.foregroundColor : UIColor.white])
    }
    private func setuptfDistricts(){
        tfDistricts.delegate = self
        tfDistricts.textColor = UIColor.white
        tfDistricts.attributedPlaceholder = NSAttributedString(string: "Districts",attributes: [NSAttributedString.Key.foregroundColor : UIColor.white])
    }
}
extension ViewController: UITextFieldDelegate {
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        if textField == tfCities {
            guard let vc = UIStoryboard(name: "CityStoryboard", bundle: nil).instantiateViewController(withIdentifier: "Cities") as? CitiesViewController else { return false}
            vc.modalPresentationStyle = .overFullScreen
            vc.didSelectedCity = {
                self.tfCities.text = $0.name
                self.codeCity = $0.cityCode
            }
            present(vc, animated: true)
        }
        if textField == tfDistricts {
            guard let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Districts") as? DistrictsViewController else{ return false}
          vc.modalPresentationStyle = .overFullScreen
            vc.code = codeCity
            present(vc, animated: true)
            vc.didselecDistricts = {
                self.tfDistricts.text = $0.name
                self.codeDistrict = $0.districtCode
            }
        }
        return false
    }
    func textFieldDidChangeSelection(_ textField: UITextField) {
        if textField == tfCities{
            tfDistricts.text = ""
        }
  }
}
extension ViewController : UITextViewDelegate{
    func textView(_ textView: UITextView, shouldInteractWith URL: URL, in characterRange: NSRange, interaction: UITextItemInteraction) -> Bool {
        UIApplication.shared.open(URL)
       return false
    }
    func textViewShouldBeginEditing(_ textView: UITextView) -> Bool {
        return false
    }
    
}
