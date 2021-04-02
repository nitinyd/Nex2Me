//
//  LoginIdVC.swift
//  Nex2Me
//
//  Created by Nitin Yadav on 1/4/2021.
//

import UIKit

class LoginIdVC: UIViewController {
    
    //Elements
    @IBOutlet var phoneNumber: UITextField!
    @IBOutlet var proceedButton: UIButton!
    @IBOutlet var selectCountryButton: UIButton!
    @IBOutlet var flagButton: UIButton!
    
    //Properties
    var viewModel = ViewModel()
    
    //IBActions
    @IBAction func proceedAction(_ sender: Any) {
        if !viewModel.authenticateNumber(phoneNumber.text) {
            let alert = UIAlertController(title: "Alert", message: "Please enter a valid Phone Number", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in alert.dismiss(animated: true, completion: nil)}))
            self.present(alert, animated: true, completion: nil)
            return
        }
        let user = User(phoneNumber: phoneNumber.text ?? "", password: nil)
        guard let loginVC = storyboard?.instantiateViewController(identifier: "loginVC", creator: { coder in
            LoginPasswordVC(coder: coder, user: user)
        })
        else {
            fatalError()
        }
        loginVC.modalPresentationStyle = .fullScreen
        present(loginVC, animated: true, completion: nil)
//        show(loginVC, sender: self)
    }
    
    @IBSegueAction func presentLoginVC(_ coder: NSCoder) -> LoginPasswordVC? {
        let user = User(phoneNumber: phoneNumber.text ?? "", password: nil)
        return LoginPasswordVC(coder: coder, user: user)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        phoneNumber.delegate = self
    }
    
}

extension LoginIdVC: UITextFieldDelegate {
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    phoneNumber.resignFirstResponder()
    return true
  }
}

//MARKUP:- Helpers
extension LoginIdVC {
    
    func setupViews() {
        setupLayers()
        setupColors()
    }
    
    func setupLayers() {
        proceedButton.layer.cornerRadius = 10.0
        selectCountryButton.layer.cornerRadius = 5.0
        phoneNumber.layer.cornerRadius = 8.0
        phoneNumber.layer.masksToBounds = true
        phoneNumber.layer.borderWidth = 1.0
        flagButton.layer.borderWidth = 1.0
    }
    
    func setupColors() {
        phoneNumber.backgroundColor = UIColor.white
        phoneNumber.layer.borderColor = UIColor.gray.cgColor
        phoneNumber.attributedPlaceholder = NSAttributedString(string: "Enter Phone Number", attributes: [NSAttributedString.Key.foregroundColor : UIColor.gray])
        flagButton.layer.borderColor = UIColor.gray.cgColor
    }
}
