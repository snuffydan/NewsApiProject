//
//  RegisterViewController.swift
//  NewsAPI
//
//  Created by Danushika Priyadarshani on 2022-06-10.
//

import UIKit

class RegisterViewController: BaseViewController {
    
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtUsername: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtConfirmPassword: UITextField!
    @IBOutlet weak var lblEmailValidation: UILabel!
    @IBOutlet weak var lblUsernameValidation: UILabel!
    @IBOutlet weak var lblPasswordValidation: UILabel!
    @IBOutlet weak var lblConfirmPasswordValidation: UILabel!
    @IBOutlet weak var btnRegister: UIButton!
    
    var hasValidationErrors = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.txtEmail.addTarget(self, action: #selector(self.textFieldDidChange(textField:)), for: UIControl.Event.editingChanged)
        self.txtUsername.addTarget(self, action: #selector(self.textFieldDidChange(textField:)), for: UIControl.Event.editingChanged)
        self.txtPassword.addTarget(self, action: #selector(self.textFieldDidChange(textField:)), for: UIControl.Event.editingChanged)
        self.txtConfirmPassword.addTarget(self, action: #selector(self.textFieldDidChange(textField:)), for: UIControl.Event.editingChanged)
    }
    
    @objc func textFieldDidChange(textField: UITextField) {
        checkValidations(textField: textField)
    }
    
//    override func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
//        if textField == txtEmail {
//            if (txtEmail.text == "" || !txtEmail.text!.isValidEmail()) {
//                lblEmailValidation.text = EMAIL_VALIDATION
//                lblEmailValidation.isHidden = false
//            } else {
//                lblEmailValidation.isHidden = true
//            }
//        } else if textField == txtPassword {
//            if txtPassword.text == "" || txtPassword.text!.count < PASSWORD_LENGTH {
//                lblPasswordValidation.text = PASSWORD_VALIDATION
//                lblPasswordValidation.isHidden = false
//            } else {
//                lblPasswordValidation.isHidden = true
//            }
//        }
//        return true
//    }
    
    private func checkValidations(textField: UITextField) {
        if textField == txtEmail {
            if (txtEmail.text == "" || !txtEmail.text!.isValidEmail()) {
                lblEmailValidation.text = EMAIL_VALIDATION
                lblEmailValidation.isHidden = false
            } else {
                lblEmailValidation.isHidden = true
            }
        } else if textField == txtPassword {
            if txtPassword.text == "" || txtPassword.text!.count < PASSWORD_LENGTH {
                lblPasswordValidation.text = PASSWORD_VALIDATION
                lblPasswordValidation.isHidden = false
            } else {
                lblPasswordValidation.isHidden = true
            }
        } else if textField == txtUsername {
            if txtUsername.text == "" {
                lblUsernameValidation.text = USERNAME_VALIDATION
                lblUsernameValidation.isHidden = false
            } else {
                lblUsernameValidation.isHidden = true
            }
        } else if textField == txtConfirmPassword {
            if txtConfirmPassword.text != txtPassword.text {
                lblConfirmPasswordValidation.text = CONFIRM_PASSWORD_VALIDATION
                lblConfirmPasswordValidation.isHidden = false
            } else {
                lblConfirmPasswordValidation.isHidden = true
            }
        } else {
            btnRegister.isEnabled = true
        }
    }

    @IBAction func tappedRegister(_ sender: Any) {
        
    }
    
    @IBAction func tappedLogIn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}
