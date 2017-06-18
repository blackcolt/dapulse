//
//  emploeesCollectionViewCell.swift
//  MobileTest
//
//  Created by Idan Magled on 15/06/2017.
//  Copyright © 2017 dapulse. All rights reserved.
//

import UIKit
import Hero

class emploeesCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var emploeeImg: UIImageView!
    @IBOutlet var emploeeNameLbl: UILabel!
    @IBOutlet var emploeeJobLbl: UILabel!
    
    
    func initWith(_ emploee:Employee) {
        emploeeImg.heroID = "emImage"
        self.selectedBackgroundView?.backgroundColor = UIColor.blue
        emploeeImg.layer.cornerRadius = emploeeImg.frame.size.width / 2;
        emploeeImg.clipsToBounds = true;
        
        emploeeNameLbl.text = emploee.name
        emploeeJobLbl.text = emploee.department
        emploeeImg.af_setImage(withURL: NSURL(string: emploee.profilePic)! as URL)
    }
}
