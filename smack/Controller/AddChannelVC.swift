//
//  AddChannelVC.swift
//  smack
//
//  Created by Rohit Goud on 23/09/18.
//  Copyright © 2018 Rohit Goud. All rights reserved.
//

import UIKit

class AddChannelVC: UIViewController {

    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var nameTxt: UITextField!
    @IBOutlet weak var channelDesTxt: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

      setUpview()
    }


    @IBAction func closeModalPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func createChannelPressed(_ sender: Any) {
    }
    
    func setUpview(){
        let closeTap = UITapGestureRecognizer(target: self, action: #selector(closeOnTap(tap:)))
        bgView.addGestureRecognizer(closeTap)
        
        nameTxt.attributedPlaceholder = NSAttributedString(string: "name", attributes: [NSAttributedStringKey.foregroundColor : SMACK_PURPLE_PLACEHOLDER])
        channelDesTxt.attributedPlaceholder = NSAttributedString(string: "description", attributes: [NSAttributedStringKey.foregroundColor: SMACK_PURPLE_PLACEHOLDER])
        
    }
    
    @objc func closeOnTap(tap: UITapGestureRecognizer){
        dismiss(animated: true, completion: nil)
    }
}
