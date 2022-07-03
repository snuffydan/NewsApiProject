//
//  AppDelegate.swift
//  NewsAPI
//
//  Created by Danushika Priyadarshani on 2022-06-02.
//

import UIKit

let appDelegate = UIApplication.shared.delegate as! AppDelegate

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let landingVC = UIStoryboard(name: StoryboardIdentifiers.UserInfo.rawValue, bundle: nil).instantiateViewController(withIdentifier: ViewControllerIdentifiers.LoginVC.rawValue) as! LoginViewController
        let navigationController = UINavigationController(rootViewController: landingVC)
        appDelegate.window?.rootViewController = navigationController
        appDelegate.window?.makeKeyAndVisible()
        
        return true
    }

}

