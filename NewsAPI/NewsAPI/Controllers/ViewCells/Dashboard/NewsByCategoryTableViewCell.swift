//
//  NewsByCategoryTableViewCell.swift
//  NewsAPI
//
//  Created by Danushika Priyadarshani on 2022-07-03.
//

import UIKit

class NewsByCategoryTableViewCell: UITableViewCell {

    @IBOutlet weak var imgBackgroundView: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblAuthor: UILabel!
    @IBOutlet weak var lblDateTime: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setUpCell(article: Article) {
        lblAuthor.text = (article.author != nil) ? article.author : ""
        lblTitle.text = article.title
        lblDateTime.text = article.publishedAt
        imgBackgroundView.sd_setImage(with: article.imageUrl, placeholderImage: #imageLiteral(resourceName: "gradient_bg"))
    }

}
