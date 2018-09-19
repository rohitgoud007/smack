//
//  ChannelVC.swift
//  smack
//
//  Created by Rohit Goud on 19/09/18.
//  Copyright © 2018 Rohit Goud. All rights reserved.
//

import UIKit

class ChannelVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.revealViewController()?.rearViewRevealWidth = self.view.frame.size.width - 60//Setting the size of channel view
    }
    


}
