//
//  UserDataService.swift
//  smack
//
//  Created by Rohit Goud on 21/09/18.
//  Copyright © 2018 Rohit Goud. All rights reserved.
//

import Foundation

class UserDataService {
    static let instance = UserDataService()
    
    private(set) public var id = ""
    private(set) public var avatarColor = ""
    private(set) public var avatarName = ""
    private(set) public var email = ""
    private(set) public var name = ""
    
    func setUserData(id: String, color: String, avatarName: String, email:String, name:String){
        self.id = id
        self.avatarName = avatarName
        self.avatarColor = color
        self.email = email
        self.name = name
    }
    
    //will be used later to store the name of the avatar from AvatarPickerVC and used tin CreateAccountVC to load up the image
    func setAvatarName(avatarName: String){
        self.avatarName = avatarName
    }
}
