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

// MARK: Database

enum DatabaseName: String {
    case User = "User"
}

enum EntityName: String {
    case UserData = "UserData"
}

enum AttributeName: String {
    case Email = "email"
    case Username = "username"
    case Password = "password"
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
    case ErrorOccured = "An error occured. Please try again later"
    case NoInternet = "Please make sure your mobile has internet"
    case DuplicateEmail = "Email address already exists. Please enter another email address"
    case DuplicateUsername = "Username already exists. Please enter another username"
    case InvalidUsername = "Invalid username. Please try again"
    case InvalidPassword = "Invalid password. Please try again"
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
