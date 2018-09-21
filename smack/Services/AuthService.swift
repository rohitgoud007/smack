//
//  AuthService.swift
//  smack
//
//  Created by Rohit Goud on 20/09/18.
//  Copyright © 2018 Rohit Goud. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class AuthService {
    static let instance = AuthService()
    
    //stores simple data in Users device and can be retrived anytime using userDefaults
    let defaults = UserDefaults.standard
    
    var isLoggedIn: Bool {
        get {
            return defaults.bool(forKey: LOGGED_IN_KEY)
        }
        
        set{
            defaults.set(newValue, forKey: LOGGED_IN_KEY)
        }
    }
    
    var authtoken: String{
        get {
            return defaults.value(forKey: TOKEN_KEY) as! String
        }
        
        set{
            defaults.set(newValue, forKey: TOKEN_KEY)
        }
    }
    
    var userEmail: String{
        get{
           return defaults.value(forKey: USER_EMAIL) as! String
        }
        
        set{
            defaults.set(newValue, forKey: USER_EMAIL)
        }
    }
    
    func registerUser(email: String, password: String, completion: @escaping CompletionHandler){
        let lowercaseEmail = email.lowercased()
        
        let body: [String: Any ] = [
            "email": lowercaseEmail,
            "password": password
        ]
        
        //Making a post request to server and passing header and body and response is captured and setting the value of completion closure
        Alamofire.request(URL_REGISTER, method: .post, parameters: body, encoding: JSONEncoding.default, headers: HEADER).responseString { (response) in
            
            if response.result.error == nil {
                completion(true)
            }else {
                completion(false)
                debugPrint(response.result.error as Any)
            }
        }
    }
    
    func loginUser(email: String, password: String, completion: @escaping CompletionHandler){
        let lowercaseEmail = email.lowercased()
        let body: [String: Any] = [
            "email": lowercaseEmail,
            "password": password
        ]
        
        Alamofire.request(URL_LOGIN, method: .post, parameters: body, encoding: JSONEncoding.default, headers: HEADER).responseJSON { (response) in
            
            if response.result.error == nil{
                guard let data = response.data else {return}
                let json = JSON(data: data)
                self.userEmail = json["user"].stringValue
                self.authtoken = json["token"].stringValue
                self.isLoggedIn = true
                
                completion(true)
            }else {
                completion(false)
                debugPrint(response.result.error as Any)
            }
        }
    }
    
    func createUser(name: String, email: String, avatarName: String, avatarColor: String, completion: @escaping CompletionHandler){
        let lowerCaseEmail = email.lowercased()
        
        let header = [
            "Authorization": "Bearer \(AuthService.instance.authtoken)",
            "Content-Type": "application/json; charset=utf-8 "
        ]
        
        let body: [String: Any] = [
            "name": name,
            "email": lowerCaseEmail,
            "avatarColor": avatarColor,
            "avatarName": avatarName
        ]
        
        Alamofire.request(URL_CREATE_USER, method: .post, parameters: body, encoding: JSONEncoding.default, headers: header).responseJSON { (response) in
            
            if response.result.error == nil {
                guard let data = response.data else {return}
                let json = JSON(data: data)
                let name = json["name"].stringValue
                let email = json["email"].stringValue
                let avatarColor = json["avatarColor"].stringValue
                let avatarName = json["avatarName"].stringValue
                let id = json["_id"].stringValue
                
                UserDataService.instance.setUserData(id: id, color: avatarColor, avatarName: avatarName, email: email, name: name)
                completion(true)
            }else {
                completion(false)
            }
            
        }
    }
    
}
