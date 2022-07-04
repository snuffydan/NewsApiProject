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
    case Common = "Common"
}

enum ViewControllerIdentifiers: String {
    case LoginVC = "loginVC"
    case RegisterVC = "registerVC"
    case CommonAlertPopupVC = "alertPopUpVC"
    case DashboardVC = "dashboardVC"
    case NewsDetailsVC = "newsDetailsVC"
}

enum CollectionViewCellIdentifiers: String {
    case LatestNewsCell = "latestNewsCell"
    case NewsCategoryCell = "newsCategoryCell"
}

enum TableViewCellIdentifier: String {
    case NewsByCategoryCell = "newsByCategoryCell"
}

//MARK: Networking

enum Header: String {
    case BasicAuthorization = "Authorization"
}

enum NewsService: String {
    case GetLatestNews = "top-headlines?"
    case GetEverything = "everything?"
}

enum ResponseStatus: String {
    case Success = "ok"
    case Error = "failure"
}


//MARK: Errors

enum GeneralErrorTitles: String {
    case GeneralError = "Error"
}

enum GeneralErrors: String {
    case NoResponseFromServer = "An error occured. Please try again later"
    case NoInternet = "Please make sure your mobile has internet"
}

// MARK: Other Enumerations

enum NewsCategory: String, CaseIterable {
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
