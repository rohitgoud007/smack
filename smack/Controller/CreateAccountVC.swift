//
//  CreateAccountVC.swift
//  smack
//
//  Created by Rohit Goud on 20/09/18.
//  Copyright © 2018 Rohit Goud. All rights reserved.
//

import UIKit

class CreateAccountVC: UIViewController {

    //Outlets
    
    @IBOutlet weak var usernameTxt: UITextField!
    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var passwordTxt: UITextField!
    @IBOutlet weak var userImg: UIImageView!
    
    //Variables
    
    var avatarName = "userDefault"
    var avatarColor = "[0.5, 0.5, 0.5, 1]"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if UserDataService.instance.avatarName != "" {
            userImg.image = UIImage(named: UserDataService.instance.avatarName)
            avatarName = UserDataService.instance.avatarName
        }
    }
    

    //unwinding all the way back back to channelVC 
    @IBAction func closePressed(_ sender: Any) {
        performSegue(withIdentifier: "UNWINDTOCHANNEL", sender: nil)
    }
    
    @IBAction func createAccountPressed(_ sender: Any) {
        guard let name = usernameTxt.text , usernameTxt.text != "" else {return}
        guard let email = emailTxt.text , emailTxt.text != "" else {return} //assign the value to email where input provided shouldnot be nil if it is return ntg
        guard let password = passwordTxt.text , passwordTxt.text != "" else {return}
        
        AuthService.instance.registerUser(email: email, password: password) { (success) in
            if success {
                AuthService.instance.loginUser(email: email, password: password, completion: { (success) in
                    if success{
                        AuthService.instance.createUser(name: name, email: email, avatarName: self.avatarName, avatarColor: self.avatarColor, completion: { (success) in
                            print(UserDataService.instance.email)
                            self.performSegue(withIdentifier: "UNWINDTOCHANNEL", sender: nil)
                        })
                    }
                })
            }
        }
    }
    
    @IBAction func pickBGColor(_ sender: Any) {
    }
    @IBAction func pickAvatar(_ sender: Any) {
        performSegue(withIdentifier: TO_AVATAR_PICKER, sender: nil)
    }
}
