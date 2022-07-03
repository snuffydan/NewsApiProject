//
//  DashboardViewController.swift
//  NewsAPI
//
//  Created by Danushika Priyadarshani on 2022-07-03.
//

import UIKit

class DashboardViewController: UIViewController {
    
    @IBOutlet weak var txtSearch: UITextField!
    @IBOutlet weak var collectionViewLatestNews: UICollectionView!
    @IBOutlet weak var collectionViewNewsCategory: UICollectionView!
    @IBOutlet weak var tableViewNewsByCategory: UITableView!
    
    var latestNewsList: [Article] = []
    var newsByCategory: [Article] = []
    var newsCategories: [String] = NewsCategoryTextToShow.allCases.map { $0.rawValue }
    var selectedCategory: NewsCategoryTextToShow = .Health
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionViewNewsCategory.reloadData()
    }

    @IBAction func tappedSearch(_ sender: Any) {
    }
    
    @IBAction func tappedNotifications(_ sender: Any) {
    }
    
    @IBAction func tappedSeeAll(_ sender: Any) {
    }
    
}

extension DashboardViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsByCategory.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let data = newsByCategory[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCellIdentifier.NewsByCategoryCell.rawValue, for: indexPath) as! NewsByCategoryTableViewCell
//        cell.setUpCell(data: data)
        return cell
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
            
//            cell.setUpCell(billerType: data)
            return cell
        } else {
            let data = self.newsCategories[indexPath.row]
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCellIdentifiers.NewsCategoryCell.rawValue, for: indexPath as IndexPath) as! NewsCategoryCollectionViewCell
            
            let isSelected = (data == selectedCategory.rawValue) ? true : false
            
            cell.setUpView(category: data, isSelected: isSelected)
            
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == collectionViewLatestNews {
            let width = collectionView.bounds.size.width - 50
            return CGSize(width: width, height: collectionView.bounds.size.height)
        } else {
            let data = self.newsCategories[indexPath.row]
            let itemSize = CGSize(width: data.size(withAttributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 12)]).width + 25, height: 32)
            return itemSize
        }
    }
}
