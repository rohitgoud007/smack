//
//  AuthService.swift
//  smack
//
//  Created by Rohit Goud on 20/09/18.
//  Copyright © 2018 Rohit Goud. All rights reserved.
//

import Foundation
import Alamofire

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
        
        //header gets attachted while making an HTTPS req
        let header = [
            "Content-Type": "application/json; charset=utf-8 "
        ]
        
        let body: [String: Any ] = [
            "email": lowercaseEmail,
            "password": password
        ]
        //Making a post request to server and passing header and body and response is captured and setting the values of completion closure
        Alamofire.request(URL_REGISTER, method: .post, parameters: body, encoding: JSONEncoding.default, headers: header).responseString { (response) in
            
            if response.result.error == nil {
                completion(true)
            }else {
                completion(false)
                debugPrint(response.result.error as Any)
            }
        }
    }
    
}
