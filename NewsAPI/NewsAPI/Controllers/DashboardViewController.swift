//
//  DashboardViewController.swift
//  NewsAPI
//
//  Created by Danushika Priyadarshani on 2022-07-03.
//

import UIKit

class DashboardViewController: BaseViewController {
    
    @IBOutlet weak var txtSearch: UITextField!
    @IBOutlet weak var collectionViewLatestNews: UICollectionView!
    @IBOutlet weak var collectionViewNewsCategory: UICollectionView!
    @IBOutlet weak var tableViewNewsByCategory: UITableView!
    
    var latestNewsList: [Article] = []
    var newsByCategoryList: [Article] = []
    var newsCategories: [String] = NewsCategory.allCases.map { $0.rawValue }
    var selectedCategory: NewsCategory = .Health
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionViewNewsCategory.reloadData()
        getLatestNews()
        getNewsByCategory(category: selectedCategory.rawValue)
    }
    
    private func getLatestNews() {
        if (isConnectedToInternet()) {
            showActivityIndicator()
            
            NewsManager.getLatestNews() { (result) in
                self.hideActivityIndicator()
                
                if result?.status == ResponseStatus.Success.rawValue {
                    self.latestNewsList = result?.articles ?? []
                    self.collectionViewLatestNews.reloadData()
                } else {
                    self.showCustomAlert(title: GeneralErrorTitles.GeneralError.rawValue, message: GeneralErrors.NoResponseFromServer.rawValue)
                }
            }
        }
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
                    self.showCustomAlert(title: GeneralErrorTitles.GeneralError.rawValue, message: GeneralErrors.NoResponseFromServer.rawValue)
                }
            }
        }
    }
    
    private func searchNews(searchText: String) {
        if (isConnectedToInternet()) {
            showActivityIndicator()
            
            NewsManager.searchNews(searchText: searchText) { (result) in
                self.hideActivityIndicator()
                
                if result?.status == ResponseStatus.Success.rawValue {
                    // TODO:
                } else {
                    self.showCustomAlert(title: GeneralErrorTitles.GeneralError.rawValue, message: GeneralErrors.NoResponseFromServer.rawValue)
                }
            }
        }
    }

    @IBAction func tappedSearch(_ sender: Any) {
    }
    
    @IBAction func tappedNotifications(_ sender: Any) {
    }
    
    @IBAction func tappedSeeAll(_ sender: Any) {
    }
    
    private func goToNewsDetails(article: Article) {
        let newsDetailsVC = UIStoryboard(name: StoryboardIdentifiers.Main.rawValue, bundle: nil).instantiateViewController(withIdentifier: ViewControllerIdentifiers.NewsDetailsVC.rawValue) as! NewsDetailsViewController
        newsDetailsVC.newsArticle = article
        self.navigationController?.pushViewController(newsDetailsVC, animated: true)
    }
    
}

extension DashboardViewController: UITableViewDelegate, UITableViewDataSource {

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
        let data = self.latestNewsList[indexPath.row]
        self.goToNewsDetails(article: data)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 128
    }
}

extension DashboardViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == collectionViewLatestNews {
            return latestNewsList.count
        } else {
            return newsCategories.count
        }
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == collectionViewLatestNews {
            let data = self.latestNewsList[indexPath.row]
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCellIdentifiers.LatestNewsCell.rawValue, for: indexPath as IndexPath) as! LatestNewsCollectionViewCell
            
            cell.setUpCell(article: data)
            return cell
        } else {
            let data = self.newsCategories[indexPath.row]
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCellIdentifiers.NewsCategoryCell.rawValue, for: indexPath as IndexPath) as! NewsCategoryCollectionViewCell
            
            let isSelected = (data == selectedCategory.rawValue) ? true : false
            
            cell.setUpView(category: data, isSelected: isSelected)
            
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == collectionViewLatestNews {
            let data = self.latestNewsList[indexPath.row]
            self.goToNewsDetails(article: data)
        } else {
            let data = self.newsCategories[indexPath.row]
            let selectedEnumValue = NewsCategory(rawValue: data)!
            selectedCategory = selectedEnumValue
            self.collectionViewNewsCategory.reloadData()
            self.getNewsByCategory(category: data.lowercased())
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == collectionViewLatestNews {
            let width = collectionView.bounds.size.width - 30
            return CGSize(width: width, height: 240)
        } else {
            let data = self.newsCategories[indexPath.row]
            let itemSize = CGSize(width: data.size(withAttributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 12)]).width + 25, height: 32)
            return itemSize
        }
    }
}
