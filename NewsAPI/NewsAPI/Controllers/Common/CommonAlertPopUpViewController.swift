//
//  CommonAlertPopUpViewController.swift
//  NewsAPI
//
//  Created by Danushika Priyadarshani on 2022-07-03.
//

import UIKit

class CommonAlertPopUpViewController: BaseViewController {
    
    @IBOutlet weak var lblAlertMsg: UILabel!
    @IBOutlet weak var btnOk: UIButton!
    @IBOutlet weak var imgViewStatus: UIImageView!
    
    var callbackForOkButton : ((Bool)->())?
    
    var titleText: String?
    var alertMsg: String?
    var okBtnTitle: String?
    var actionButnTitle: String?
    var statusImg: UIImage?
    var showActionButton: Bool = true

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpView()
    }
    
    private func setUpView() {
        if (alertMsg != nil) {
            lblAlertMsg.text = alertMsg
        }
        
        if (okBtnTitle != nil) {
            btnOk.setTitle(okBtnTitle, for: .normal)
        }
        
        imgViewStatus.image = statusImg
    }
    
    @IBAction func okBtnPressed(_ sender: Any) {
        self.dismiss(animated: true) {
            self.callbackForOkButton?(true)
        }
    }

}
