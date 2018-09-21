//
//  AvatarCell.swift
//  smack
//
//  Created by Rohit Goud on 21/09/18.
//  Copyright © 2018 Rohit Goud. All rights reserved.
//

import UIKit

class AvatarCell: UICollectionViewCell {
    
    @IBOutlet weak var AvatarImg: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpView()
    }
    
    func setUpView(){
        self.layer.cornerRadius = 10.0
        self.layer.backgroundColor = UIColor.lightGray.cgColor
        self.clipsToBounds = true
    }
}
