//
//  CommonAlertPopUpViewController.swift
//  NewsAPI
//
//  Created by Danushika Priyadarshani on 2022-07-03.
//

import UIKit

class CommonAlertPopUpViewController: UIViewController {
    
    @IBOutlet weak var lblAlertMsg: UILabel!
    @IBOutlet weak var btnOk: UIButton!
    @IBOutlet weak var btnAction: UIButton!
    @IBOutlet weak var imgViewStatus: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    
    var callbackForOkButton : ((Bool)->())?
    var callbackForActionButton: ((Bool)->())?
    
    var titleText: String?
    var alertMsg: String?
    var okBtnTitle: String?
    var actionButnTitle: String?
    var statusImg: UIImage?
    var showActionButton: Bool = true

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func actionBtnTapped(_ sender: Any) {
        self.dismiss(animated: true) {
            self.callbackForActionButton?(true)
        }
    }
    
    @IBAction func okBtnPressed(_ sender: Any) {
        self.dismiss(animated: true) {
            self.callbackForOkButton?(true)
        }
    }

}
