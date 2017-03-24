//
//  LoginViewController.swift
//  whale-ios-winnie
//
//  Created by Winnie Wen on 3/22/17.
//  Copyright © 2017 wiwen. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func loginAction(_ sender: Any) {
        
        let loginAPI = LoginAPI()
        
        guard let email = emailTextField.text else {
            return
        }
        
        guard let password = passwordTextField.text else {
            return
        }
        
        
        loginAPI.userLogin(email: email, password: password) { (statusCode) in
            if statusCode == 200 {
                let appDelegate = UIApplication.shared.delegate! as! AppDelegate
                
                let initialViewController = self.storyboard?.instantiateViewController(withIdentifier: "TabBarView") as! TabBarViewController
                appDelegate.window?.rootViewController = initialViewController
                appDelegate.window?.makeKeyAndVisible()
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
