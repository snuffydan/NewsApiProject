//
//  InitialViewController.swift
//  NewsAPI
//
//  Created by Danushika Priyadarshani on 2022-07-05.
//

import UIKit

class InitialViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if UserDefinedConfigs.isUserLoggedIn() {
            let dashboardVC = UIStoryboard(name: StoryboardIdentifiers.Main.rawValue, bundle: nil).instantiateViewController(withIdentifier: ViewControllerIdentifiers.DashboardVC.rawValue) as! DashboardViewController
            let navigationController = UINavigationController(rootViewController: dashboardVC)
            appDelegate.window?.rootViewController = navigationController
            appDelegate.window?.makeKeyAndVisible()
        } else {
            let loginVC = UIStoryboard(name: StoryboardIdentifiers.UserInfo.rawValue, bundle: nil).instantiateViewController(withIdentifier: ViewControllerIdentifiers.LoginVC.rawValue) as! LoginViewController
            let navigationController = UINavigationController(rootViewController: loginVC)
            appDelegate.window?.rootViewController = navigationController
            appDelegate.window?.makeKeyAndVisible()
        }
    }

}
