//
//  LoginViewController.swift
//  NewsAPI
//
//  Created by Danushika Priyadarshani on 2022-06-10.
//

import UIKit

class LoginViewController: BaseViewController {
    
    @IBOutlet weak var txtUsername: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func tappedLogin(_ sender: Any) {
    }
    
    @IBAction func tappedRegister(_ sender: Any) {
        let registerVC = UIStoryboard(name: StoryboardIdentifiers.UserInfo.rawValue, bundle: nil).instantiateViewController(withIdentifier: ViewControllerIdentifiers.RegisterVC.rawValue) as! RegisterViewController
        self.navigationController?.pushViewController(registerVC, animated: true)
    }
}
