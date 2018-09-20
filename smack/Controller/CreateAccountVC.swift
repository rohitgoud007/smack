//
//  CreateAccountVC.swift
//  smack
//
//  Created by Rohit Goud on 20/09/18.
//  Copyright © 2018 Rohit Goud. All rights reserved.
//

import UIKit

class CreateAccountVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    //unwinding all the way back back to channelVC 
    @IBAction func closePressed(_ sender: Any) {
        performSegue(withIdentifier: UNWIND, sender: nil)
    }
    

}
