//
//  UserDefinedConfigs.swift
//  NewsAPI
//
//  Created by Danushika Priyadarshani on 2022-07-05.
//

import Foundation

class UserDefinedConfigs {
    
    static let defaults = UserDefaults.standard
    
    static let userLoginStatus = "isUserLoggedIn"
    
    //UserDefaults
    static func setIsUserLoggedIn(status: Bool) {
        defaults.set(status, forKey: userLoginStatus)
    }
    
    static func isUserLoggedIn()-> Bool {
        return defaults.bool(forKey: userLoginStatus)
    }

}
