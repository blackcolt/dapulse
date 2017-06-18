//
//  detailViewController.swift
//  MobileTest
//
//  Created by Idan Magled on 15/06/2017.
//  Copyright © 2017 dapulse. All rights reserved.
//

import UIKit

class detailViewController: UIViewController {

    var currentEmploee:Employee?
  
    @IBOutlet var emploeeyImg: UIImageView!
   
    @IBOutlet var emploeeyJobLbl: UILabel!
    @IBOutlet var emploeeyNameLbl: UILabel!
    @IBOutlet var emploeeyPhoneLbl: UILabel!
    @IBOutlet var emploeeyEmailLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       if currentEmploee != nil {
            emploeeyImg.layer.cornerRadius = emploeeyImg.frame.size.width / 2;
            emploeeyImg.clipsToBounds = true;
        
            emploeeyNameLbl.text = currentEmploee?.name
            emploeeyEmailLbl.text = currentEmploee?.email
            emploeeyPhoneLbl.text = currentEmploee?.phone
            emploeeyJobLbl.text = currentEmploee?.department
            emploeeyImg.af_setImage(withURL: NSURL(string: (currentEmploee?.profilePic)!)! as URL)
        }
    }
}
