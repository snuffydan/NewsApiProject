//
//  LatestNewsCollectionViewCell.swift
//  NewsAPI
//
//  Created by Danushika Priyadarshani on 2022-07-03.
//

import UIKit

class LatestNewsCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var lblAuthor: UILabel!
    @IBOutlet weak var imgBackground: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    
    func setUpCell(article: Article) {
        lblAuthor.text = article.author
        lblTitle.text = article.title
        lblDescription.text = article.description
//        imgBackground.sd_setImage(with: article.imageUrl, placeholderImage: #imageLiteral(resourceName: "gradient_bg"))
    }
}
