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
        let user = Utilities.getSpecificDataFromDatabase(username: txtUsername.text ?? "")
        
        if user != nil {
            if txtPassword.text == user?.password {
                let dashboardVC = UIStoryboard(name: StoryboardIdentifiers.Main.rawValue, bundle: nil).instantiateViewController(withIdentifier: ViewControllerIdentifiers.DashboardVC.rawValue) as! DashboardViewController
                let navigationController = UINavigationController(rootViewController: dashboardVC)
                appDelegate.window?.rootViewController = navigationController
                appDelegate.window?.makeKeyAndVisible()
            } else {
                self.showCustomAlert(message: GeneralErrors.InvalidPassword.rawValue)
            }
        } else {
            self.showCustomAlert(message: GeneralErrors.InvalidUsername.rawValue)
        }
    }
    
    @IBAction func tappedRegister(_ sender: Any) {
        let registerVC = UIStoryboard(name: StoryboardIdentifiers.UserInfo.rawValue, bundle: nil).instantiateViewController(withIdentifier: ViewControllerIdentifiers.RegisterVC.rawValue) as! RegisterViewController
        self.navigationController?.pushViewController(registerVC, animated: true)
    }

}
