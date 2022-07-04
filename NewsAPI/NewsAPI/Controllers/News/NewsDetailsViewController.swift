//
//  NewsDetailsViewController.swift
//  NewsAPI
//
//  Created by Danushika Priyadarshani on 2022-07-04.
//

import UIKit

class NewsDetailsViewController: UIViewController {
    
    @IBOutlet weak var imgBanner: UIImageView!
    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblAuthor: UILabel!
    @IBOutlet weak var txtViewDescription: UITextView!
    
    var newsArticle: Article?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpView()
    }
    
    private func setUpView() {
        imgBanner.sd_setImage(with: newsArticle?.imageUrl, placeholderImage: #imageLiteral(resourceName: "gradient_bg"))
        lblAuthor.text = (newsArticle?.author != nil) ? newsArticle?.author : ""
        lblTitle.text = newsArticle?.title
        lblDate.text = newsArticle?.publishedAt
        txtViewDescription.text = newsArticle?.description
    }
    
    @IBAction func tappedFavourite(_ sender: Any) {
    }
    
    @IBAction func goBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}
