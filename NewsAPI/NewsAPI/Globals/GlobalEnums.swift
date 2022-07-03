//
//  GlobalEnums.swift
//  NewsAPI
//
//  Created by Danushika Priyadarshani on 2022-06-10.
//

import UIKit

// MARK: Storyboard-related
enum StoryboardIdentifiers: String {
    case UserInfo = "UserInfo"
    case Main = "Main"
}

enum ViewControllerIdentifiers: String {
    case LoginVC = "loginVC"
    case RegisterVC = "registerVC"
    case CommonAlertPopupVC = "alertPopUpVC"
    case DashboardVC = "dashboardVC"
}

enum CollectionViewCellIdentifiers: String {
    case LatestNewsCell = "latestNewsCell"
    case NewsCategoryCell = "newsCategoryCell"
}

enum TableViewCellIdentifier: String {
    case NewsByCategoryCell = "newsByCategoryCell"
}

// MARK: Other Enumerations

enum NewsCategoryTextToShow: String, CaseIterable {
    case Health = "Health"
    case Technology = "Technology"
    case Finance = "Finance"
    case Arts = "Arts"
    case Sports = "Sports"
    case Business = "Business"
    case Entertainment = "Entertainment"
    case General = "General"
    case Science = "Science"
}

enum NewsCategory: String {
    case Business = "business"
    case Entertainment = "entertainment"
    case General = "general"
    case Health = "health"
    case Science = "science"
    case Sports = "sports"
    case Technology = "technology"
}
