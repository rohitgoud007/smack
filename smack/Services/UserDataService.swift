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
    
    func returnUIColor(components: String) -> UIColor{
        let scanner = Scanner(string: components)
        let skipped = CharacterSet(charactersIn: "[], ")
        let comma = CharacterSet(charactersIn: ",")
        
        var r,g,b,a: NSString?
        scanner.charactersToBeSkipped = skipped
        scanner.scanUpToCharacters(from: comma, into: &r)
        scanner.scanUpToCharacters(from: comma, into: &g)
        scanner.scanUpToCharacters(from: comma, into: &b)
        scanner.scanUpToCharacters(from: comma, into: &a)
        
        let defaultColor = UIColor.lightGray
        
        guard let rUnwrapped = r else {return defaultColor}
        guard let gUnwrapped = g else {return defaultColor}
        guard let bUnwrapped = b else {return defaultColor}
        guard let aUnwrapped = a else {return defaultColor}
        
        let rFloat = CGFloat(rUnwrapped.doubleValue)
        let gFloat = CGFloat(gUnwrapped.doubleValue)
        let bFloat = CGFloat(bUnwrapped.doubleValue)
        let aFloat = CGFloat(aUnwrapped.doubleValue)
        
        let newColor = UIColor(red: rFloat, green: gFloat, blue: bFloat, alpha: aFloat)
        return newColor
    }
}
