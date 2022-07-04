//
//  BaseViewController.swift
//  NewsAPI
//
//  Created by Danushika Priyadarshani on 2022-06-10.
//

import UIKit

class BaseViewController: UIViewController, UITextFieldDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        hideKeyboardOnTap()
    }
    
    func hideKeyboardOnTap() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(hideKeyboardAfterTap))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func hideKeyboardAfterTap() {
        view.endEditing(true)
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return true
    }
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        return true
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        return true
    }
    
    func isConnectedToInternet() -> Bool {
        do {
            let reachability = try Reachability()
            
            if reachability.connection == .unavailable {
                showNoNetworkAlert()
                return false
            } else {
                return true
            }
            
        } catch let error {
            fatalError(error.localizedDescription)
        }
    }
    
    func showNoNetworkAlert()
    {
        let alertController = UIAlertController (title: "Cellular Data is Turned Off", message: "Turn on cellular data or use Wi-Fi to access data.", preferredStyle: .alert)
        
        let settingsAction = UIAlertAction(title: "Settings", style: .default) { (_) -> Void in
            
            if let url = URL(string: UIApplication.openSettingsURLString) {
                if UIApplication.shared.canOpenURL(url) {
                    if #available(iOS 10.0, *) {
                        UIApplication.shared.open(url, completionHandler: nil)
                    } else {
                        UIApplication.shared.openURL(url)
                    }
                }
            }
        }
        alertController.addAction(settingsAction)
        let cancelAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(cancelAction)
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    func showActivityIndicator() {
        ActivityIndicator.start()
    }
    
    func hideActivityIndicator() {
        ActivityIndicator.stop()
    }
    
    func showCustomAlert(title: String? = nil, message: String, btnTitle: String? = nil, showActionButton: Bool = true, statusImg: UIImage? = UIImage(named: "warning-red"), completion: (() -> Void)? = nil) {
        
        let alertVC = UIStoryboard(name: StoryboardIdentifiers.Common.rawValue, bundle: nil).instantiateViewController(withIdentifier: ViewControllerIdentifiers.CommonAlertPopupVC.rawValue) as! CommonAlertPopUpViewController
        alertVC.titleText = title
        alertVC.alertMsg = message
        alertVC.okBtnTitle = btnTitle
        alertVC.statusImg = statusImg
        alertVC.showActionButton = showActionButton
        alertVC.callbackForOkButton = { (_) in
          completion?()
        }
        self.present(alertVC, animated: true, completion: nil)
    }

}
