//
//  News.swift
//  NewsAPI
//
//  Created by Danushika Priyadarshani on 2022-07-03.
//

import UIKit

struct NewsResponse: Codable {
    var status: String?
    var totalResults: Int?
    var articles: [Article]?
}

struct Article: Codable {
    var source: News?
    var author: String?
    var title: String?
    var description: String?
    var url: String?
    
    var newsUrl: URL? {
        get {
            return URL(string: url ?? "")
        }
    }
    var urlToImage: String?
    
    var imageUrl: URL? {
        get {
            return URL(string: urlToImage ?? "")
        }
    }
    var publishedAt: String?
    var content: String?
}

struct News: Codable {
    var id: String?
    var name: String?
    var description: String?
    var url: String?
    var category: String?
    var language: String?
    var country: String?
}
