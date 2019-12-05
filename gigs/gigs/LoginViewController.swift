//
//  LoginViewController.swift
//  gigs
//
//  Created by Lambda_School_Loaner_219 on 12/4/19.
//  Copyright © 2019 Lambda_School_Loaner_219. All rights reserved.
//

import UIKit

enum LoginType {
    case signUp
    case logIn
}

class LoginViewController: UIViewController {
    @IBAction func SignUpButton(_ sender: UIButton) {
        guard let gigController = gigController else {return}
        guard let username = usernameTextField.text, !username.isEmpty, let password = passwordTextField.text, !password.isEmpty else {return}
        
        let user = User(username:username, password: password)
        
        switch loginType {
        case .signUp:
            gigController.signUp(with: user) { error in
                if let error = error {
                    print("error occured during sign up \(error)")
                } else {
                    let alertController = UIAlertController(title:"Sign Up succesfull", message: "Please login now", preferredStyle: .alert)
                    alertController.addAction(UIAlertAction(title:"OK", style:.default, handler: nil))
                    self.present(alertController, animated: true) {
                        self.loginType = .logIn
                        self.segmentedControl.selectedSegmentIndex = 1
                        self.signUpButton.setTitle("Log In", for:.normal)
                    }
                }
                
            }
            case .logIn:
                gigController.login(with:user) { error in
                    if let error = error {
                        print(error)
                    } else {
                        self.dismiss(animated:true, completion:nil)
                    }
            }
        }
        
        
        
        }
    
    @IBAction func loginTypeChanged(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            loginType = .signUp
            signUpButton.setTitle("sign up", for: .normal)
            
        case 1:
            loginType = .logIn
            signUpButton.setTitle("log in", for: .normal)
            
        default: break
        }
    }
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signUpButton: UIButton!
    
    var gigController:GigController!
    var loginType: LoginType = .signUp
    override func viewDidLoad() {
        super.viewDidLoad()
        signUpButton.layer.cornerRadius = 8.0

        
    }
    



}
