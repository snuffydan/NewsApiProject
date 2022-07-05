//
//  AllNewsViewController.swift
//  NewsAPI
//
//  Created by Danushika Priyadarshani on 2022-07-05.
//

import UIKit

class AllNewsViewController: BaseViewController {
    
    @IBOutlet weak var txtSearch: UITextField!
    @IBOutlet weak var collectionViewNewsCategory: UICollectionView!
    @IBOutlet weak var tableViewNewsByCategory: UITableView!
    @IBOutlet weak var btnFiter: UIButton!
    @IBOutlet weak var lblResultCount: UILabel!
    
    var newsByCategoryList: [Article] = []
    var newsCategories: [String] = NewsCategory.allCases.map { $0.rawValue }
    var selectedCategory: NewsCategory = .Health
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let newsCategoryCell = UINib(nibName: "NewsCategory", bundle: nil)
        self.collectionViewNewsCategory.register(newsCategoryCell, forCellWithReuseIdentifier: CollectionViewCellIdentifiers.NewsCategoryCell.rawValue)
        
        let newsByCategoryCell = UINib(nibName: "NewsByCategory", bundle: nil)
        tableViewNewsByCategory.register(newsByCategoryCell, forCellReuseIdentifier: TableViewCellIdentifier.NewsByCategoryCell.rawValue)
    }
    
    @IBAction func pressedFilter(_ sender: Any) {
    }
    
    private func getNewsByCategory(category: String) {
        if (isConnectedToInternet()) {
            showActivityIndicator()
            
            NewsManager.getNewsByCategory(category: category) { (result) in
                self.hideActivityIndicator()
                
                if result?.status == ResponseStatus.Success.rawValue {
                    self.newsByCategoryList = result?.articles ?? []
                    self.tableViewNewsByCategory.reloadData()
                } else {
                    self.showCustomAlert(title: GeneralErrorTitles.GeneralError.rawValue, message: GeneralErrors.ErrorOccured.rawValue)
                }
            }
        }
    }
    
    private func goToNewsDetails(article: Article) {
        let newsDetailsVC = UIStoryboard(name: StoryboardIdentifiers.Main.rawValue, bundle: nil).instantiateViewController(withIdentifier: ViewControllerIdentifiers.NewsDetailsVC.rawValue) as! NewsDetailsViewController
        newsDetailsVC.newsArticle = article
        self.navigationController?.pushViewController(newsDetailsVC, animated: true)
    }
    
}

extension AllNewsViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsByCategoryList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let data = newsByCategoryList[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCellIdentifier.NewsByCategoryCell.rawValue, for: indexPath) as! NewsByCategoryTableViewCell
        cell.setUpCell(article: data)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let data = self.newsByCategoryList[indexPath.row]
        self.goToNewsDetails(article: data)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 128
    }
}

extension AllNewsViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return newsCategories.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let data = self.newsCategories[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCellIdentifiers.NewsCategoryCell.rawValue, for: indexPath as IndexPath) as! NewsCategoryCollectionViewCell
        
        let isSelected = (data == selectedCategory.rawValue) ? true : false
        
        cell.setUpView(category: data, isSelected: isSelected)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let data = self.newsCategories[indexPath.row]
        let selectedEnumValue = NewsCategory(rawValue: data)!
        selectedCategory = selectedEnumValue
        self.collectionViewNewsCategory.reloadData()
        self.getNewsByCategory(category: data.lowercased())
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let data = self.newsCategories[indexPath.row]
        let itemSize = CGSize(width: data.size(withAttributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 12)]).width + 25, height: 32)
        return itemSize
    }
}
