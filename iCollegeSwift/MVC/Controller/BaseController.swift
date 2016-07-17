//
//  BaseController.swift
//  iCollegeSwift
//
//  Created by Kunal Gupta on 16/06/16.
//  Copyright © 2016 Kunal Gupta. All rights reserved.
//

import UIKit

class BaseController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func showAlert(message:String){
        let alert = UIAlertView()
        alert.addButtonWithTitle("OK")
        alert.message = message
        alert .show()
    }
}
