//
//  Utilities.swift
//  NewsAPI
//
//  Created by Danushika Priyadarshani on 2022-07-04.
//

import CoreData
import UIKit

class Utilities {
    
    static func formatDateString(dateString: String, fromFormat: String? = nil, toFormat: String)-> String
    {
        var dateFormats = ["yyyy-MM-dd HH:mm:ss", "yyyy-MM-dd hh:mm:ss a", "YYYY-MM-dd", "yyyy-MM-dd'T'HH:mm:ss.SSSZ", "yyyy-MM-dd HH:mm:ss:mmmm", "yyyy-MM-dd HH:mm:ss.s"]

        let dateFormatterFrom = DateFormatter()
        
        let dateFormatterTo = DateFormatter()
        dateFormatterTo.dateFormat = toFormat
        
        if (fromFormat != nil) {
            dateFormats.append(fromFormat ?? "")
        }
        
        for format in dateFormats {
            dateFormatterFrom.dateFormat = format
            
            if let date = dateFormatterFrom.date(from: dateString) {
                return dateFormatterTo.string(from: date)
            } else {
                print("There was an error decoding the time string")
            }
        }
        
        return ""
    }
    
    static func saveToDatabase(email: String, username: String, password: String) -> Bool {
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return false }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: EntityName.UserData.rawValue, in: managedContext)!
        let user = NSManagedObject(entity: entity, insertInto: managedContext)
        user.setValue(email, forKeyPath: AttributeName.Email.rawValue)
        user.setValue(username, forKeyPath: AttributeName.Username.rawValue)
        user.setValue(password, forKeyPath: AttributeName.Password.rawValue)
        
        do {
            try managedContext.save()
            return true
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
            return false
        }
    }
    
    static func getAllDataFromDatabase() -> [User] {
        var users: [User] = []
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return users }
        var usersManagedObj: [NSManagedObject] = []
        
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: EntityName.UserData.rawValue)
        
        do {
            usersManagedObj = try managedContext.fetch(fetchRequest)
            for userManagedObj in usersManagedObj {
                var user = User()
                user.email = userManagedObj.value(forKeyPath: AttributeName.Email.rawValue) as? String
                user.username = userManagedObj.value(forKeyPath: AttributeName.Username.rawValue) as? String
                user.password = userManagedObj.value(forKeyPath: AttributeName.Password.rawValue) as? String
                users.append(user)
            }
            return users
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
            return users
        }
    }
    
    static func getSpecificDataFromDatabase(username: String) -> User? {
        var user = User()
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return nil }
        var userManagedObj: [NSManagedObject] = []
        
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: EntityName.UserData.rawValue)
        let predicate = NSPredicate(format: "username == %@", username)
        fetchRequest.predicate = predicate
        
        do {
            userManagedObj = try managedContext.fetch(fetchRequest)
            if userManagedObj.isEmpty {
                return nil
            }
            user.email = (userManagedObj.first)?.value(forKeyPath: AttributeName.Email.rawValue) as? String
            user.username = (userManagedObj.first)?.value(forKeyPath: AttributeName.Username.rawValue) as? String
            user.password = (userManagedObj.first)?.value(forKeyPath: AttributeName.Password.rawValue) as? String
            return user
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
            return nil
        }
    }
}
