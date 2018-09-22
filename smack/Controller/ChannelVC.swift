//
//  ChannelVC.swift
//  smack
//
//  Created by Rohit Goud on 19/09/18.
//  Copyright © 2018 Rohit Goud. All rights reserved.
//

import UIKit

class ChannelVC: UIViewController {

    //Outlets
    
    @IBOutlet weak var userImg: CircleImage!
    @IBOutlet weak var loginBtn: UIButton!
    @IBAction func prepareForUnwind(segue: UIStoryboardSegue){}
    override func viewDidLoad() {
        super.viewDidLoad()

        self.revealViewController()?.rearViewRevealWidth = self.view.frame.size.width - 60//Setting the size of channel view
        NotificationCenter.default.addObserver(self, selector: #selector(notifUserDataDidChange), name: NOTIF_USER_DATA_DID_CHANGE, object: nil)
    }
    

    @IBAction func loginBtnPressed(_ sender: Any) {
        if AuthService.instance.isLoggedIn {
            let profile = ProfileVC()
            profile.modalPresentationStyle = .custom
            present(profile, animated: true, completion: nil)
        }else {
             performSegue(withIdentifier: TO_LOGIN, sender: nil)
        }
       
        
    }
    
    @objc func notifUserDataDidChange(notif: Notification){
        if AuthService.instance.isLoggedIn {
        loginBtn.setTitle(UserDataService.instance.name, for: .normal)
        userImg.image = UIImage(named: UserDataService.instance.avatarName)
        userImg.backgroundColor = UserDataService.instance.returnUIColor(components: UserDataService.instance.avatarColor)
        }else {
             loginBtn.setTitle("Login", for: .normal)
            userImg.image = UIImage(named: "menuProfileIcon")
            
        }
    }
}
