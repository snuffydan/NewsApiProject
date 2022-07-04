//
//  NewsManager.swift
//  NewsAPI
//
//  Created by Danushika Priyadarshani on 2022-07-03.
//

import UIKit
import Alamofire

class NewsManager {
    
    static func getLatestNews(completionHandler: @escaping (_ result:NewsResponse?) -> Void) {
        
        let headers: HTTPHeaders = [Header.BasicAuthorization.rawValue: API_KEY]
        let parameters = "country=\(COUNTRY)"
                
        AF.request(BASE_URL + NewsService.GetLatestNews.rawValue + parameters, method: .get, encoding: JSONEncoding.default, headers: headers).validate().responseJSON { (responseData) in switch responseData.result {
            
        case .success( _):
            if(responseData.data != nil)
            {
                do {
                    let decoder = JSONDecoder()
                    let newsResponse = try decoder.decode(NewsResponse.self, from:
                        responseData.data!)
                    print(newsResponse)
                    completionHandler(newsResponse)
                } catch let parsingError {
                    print("Error", parsingError)
                    completionHandler(nil)
                }
                
            }
            else
            {
                completionHandler(nil)
            }
            
        case .failure(let error):
            print(error.localizedDescription)
            completionHandler(nil)
            }
        }
    }
    
    static func getNewsByCategory(category: String, completionHandler: @escaping (_ result:NewsResponse?) -> Void) {
        
        let headers: HTTPHeaders = [Header.BasicAuthorization.rawValue: API_KEY]
        let parameters = "country=\(COUNTRY)&category=\(category)"
                
        AF.request(BASE_URL + NewsService.GetLatestNews.rawValue + parameters, method: .get, encoding: JSONEncoding.default, headers: headers).validate().responseJSON { (responseData) in switch responseData.result {
                
        case .success( _):
            if(responseData.data != nil)
            {
                do {
                    let decoder = JSONDecoder()
                    let newsResponse = try decoder.decode(NewsResponse.self, from:
                        responseData.data!)
                    print(newsResponse)
                    completionHandler(newsResponse)
                } catch let parsingError {
                    print("Error", parsingError)
                    completionHandler(nil)
                }
                
            }
            else
            {
                completionHandler(nil)
            }
            
        case .failure(let error):
            print(error.localizedDescription)
            completionHandler(nil)
            }
        }
    }
    
    static func searchNews(searchText: String, completionHandler: @escaping (_ result:NewsResponse?) -> Void) {
        
        let headers: HTTPHeaders = [Header.BasicAuthorization.rawValue: API_KEY]
        let parameters = "q=\(searchText)"
                
        AF.request(BASE_URL + NewsService.GetEverything.rawValue + parameters, method: .get, encoding: JSONEncoding.default, headers: headers).validate().responseJSON { (responseData) in switch responseData.result {
                
        case .success( _):
            if(responseData.data != nil)
            {
                do {
                    let decoder = JSONDecoder()
                    let newsResponse = try decoder.decode(NewsResponse.self, from:
                        responseData.data!)
                    print(newsResponse)
                    completionHandler(newsResponse)
                } catch let parsingError {
                    print("Error", parsingError)
                    completionHandler(nil)
                }
                
            }
            else
            {
                completionHandler(nil)
            }
            
        case .failure(let error):
            print(error.localizedDescription)
            completionHandler(nil)
            }
        }
    }
}
