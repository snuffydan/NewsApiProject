//
//  NewsManager.swift
//  NewsAPI
//
//  Created by Danushika Priyadarshani on 2022-07-03.
//

import UIKit
import Alamofire

class NewsManager {
    
//    static func getGeneralInfo(completionHandler: @escaping (_ result:Response?) -> Void) {
//        
//        let headers: HTTPHeaders = ["content-type": "application/json", "Version": Utilities.getVersionNumber(), "Os": DEVICE_TYPE, "App-Signature": Utilities.getAppSignature(), Header.BasicAuthorization.rawValue: KeychainStore.getBasicAuthToken()]
//                
//        AF.request(BASE_URL + OnBoardingService.GetGeneralInfo.rawValue, method: .get, encoding: JSONEncoding.default, headers: headers).validate().responseJSON { (responseData) in switch responseData.result {
//            
//        case .success( _):
//            if(responseData.data != nil)
//            {
//                do {
//                    let decoder = JSONDecoder()
//                    let onBoardingResponse = try decoder.decode(Response.self, from:
//                        responseData.data!)
//                    print(onBoardingResponse)
//                    completionHandler(onBoardingResponse)
//                } catch let parsingError {
//                    print("Error", parsingError)
//                    completionHandler(nil)
//                }
//                
//            }
//            else
//            {
//                completionHandler(nil)
//            }
//            
//        case .failure(let error):
//            print(error.localizedDescription)
//            completionHandler(nil)
//            }
//        }
//    }
}
