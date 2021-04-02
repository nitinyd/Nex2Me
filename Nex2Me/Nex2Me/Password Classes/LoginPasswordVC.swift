//
//  LoginPasswordVC.swift
//  Nex2Me
//
//  Created by Nitin Yadav on 1/4/2021.
//

import UIKit

class LoginPasswordVC: UIViewController {

    //Elements
    @IBOutlet var password: UITextField!
    @IBOutlet var forgotPasswordButton: UIButton!
    @IBOutlet var loginButton: UIButton!
    
    //Properties
    var user: User
    var viewModel = ViewModel()
    
    //IBActions
    @IBAction func loginAction(_ sender: Any) {
        if viewModel.authenticatePassword(password.text) {
            let alert = UIAlertController(title: "Hey there!", message: "Phone Number: \(user.phoneNumber) \n Password: \(password.text ?? "")", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in alert.dismiss(animated: true, completion: nil)}))
            self.present(alert, animated: true, completion: nil)
        }
        else {
            let alert = UIAlertController(title: "Alert", message: "Please enter a valid Password", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in alert.dismiss(animated: true, completion: nil)}))
            self.present(alert, animated: true, completion: nil)
            return
        }
    }
    
    @IBAction func forgotPasswordAction(_ sender: Any) {
        let alert = UIAlertController(title: "Hey there!", message: "Please Contact Customer Support!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in alert.dismiss(animated: true, completion: nil)}))
        self.present(alert, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        password.delegate = self
    }
    
    required init?(coder: NSCoder) { fatalError("Oops! Something went wrong!") }
    
    init?(coder: NSCoder, user: User) {
        self.user = user
        super.init(coder: coder)
    }
    
}

extension LoginPasswordVC: UITextFieldDelegate {
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    password.resignFirstResponder()
    return true
  }
}

//MARKUP:- Helpers
extension LoginPasswordVC {
    
    func setupViews() {
        setupLayers()
        setupColors()
    }
    
    func setupLayers() {
        loginButton.layer.cornerRadius = 10.0
        password.layer.cornerRadius = 8.0
        password.layer.masksToBounds = true
        password.layer.borderWidth = 1.0
    }
    
    func setupColors() {
        password.backgroundColor = UIColor.white
        password.layer.borderColor = UIColor.gray.cgColor
        password.attributedPlaceholder = NSAttributedString(string: "Enter Password", attributes: [NSAttributedString.Key.foregroundColor : UIColor.gray])
    }
}
