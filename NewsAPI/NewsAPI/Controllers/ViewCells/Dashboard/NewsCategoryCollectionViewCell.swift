//
//  NewsCategoryCollectionViewCell.swift
//  NewsAPI
//
//  Created by Danushika Priyadarshani on 2022-07-03.
//

import UIKit

class NewsCategoryCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var viewOuter: UIView!
    @IBOutlet weak var viewInner: UIView!
    @IBOutlet weak var lblCategoryName: UILabel!
    
    var selectedOuterBorderColour = UIColor(red: 1, green: 0.7, blue: 0.713, alpha: 1)
    var selectedInnerBackgroundColour = UIColor(red: 1, green: 0.227, blue: 0.267, alpha: 1)
    var deselectedOuterBorderColour = UIColor(red: 0.941, green: 0.945, blue: 0.98, alpha: 1)
    var deselectedInnerBackgroundColour = UIColor.white
    
    func setUpView(category: String, isSelected: Bool) {
        viewOuter.backgroundColor = isSelected ? selectedOuterBorderColour : deselectedOuterBorderColour
        viewInner.backgroundColor = isSelected ? selectedInnerBackgroundColour : deselectedInnerBackgroundColour
        lblCategoryName.text = category
        lblCategoryName.textColor = isSelected ? UIColor.white : UIColor.black
    }
}
