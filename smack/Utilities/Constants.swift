//
//  Constants.swift
//  smack
//
//  Created by Rohit Goud on 20/09/18.
//  Copyright © 2018 Rohit Goud. All rights reserved.
//

import Foundation

typealias CompletionHandler = (_ Sucess: Bool) -> () //Closure -> since web req is async this can be used anywhere in btween code and returs T/F  and can be used to make checks

//URL Constansts
let BASE_URL = "https://smackrohit.herokuapp.com/v1/"
let URL_REGISTER = "\(BASE_URL)account/register"

let TO_LOGIN = "toLogin"
let TO_CREATE_ACCOUNT = "toCreateAccount"
let UNWIND = "unwindToChannel"

//User Defaults
let TOKEN_KEY = "token"
let LOGGED_IN_KEY = "loggedIn"
let USER_EMAIL = "userEmail"

