//
//  HomeVC.swift
//  iCollegeSwift
//
//  Created by Kunal Gupta on 17/07/16.
//  Copyright © 2016 Kunal Gupta. All rights reserved.
//

import UIKit

class HomeVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: ACTION BUTTON
    
    @IBAction func actionBtnMenu(sender: AnyObject) {
        let vc: SSASideMenu!
        vc = UIApplication.sharedApplication().keyWindow?.rootViewController as! SSASideMenu
        vc.presentLeftMenuViewController()
    }

}
