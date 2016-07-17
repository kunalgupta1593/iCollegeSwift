//
//  SideViewController.swift
//  iCollegeSwift
//
//  Created by cbl20 on 6/20/16.
//  Copyright © 2016 Kunal Gupta. All rights reserved.
//

import UIKit

class SideViewController: UIViewController {

    
    @IBOutlet weak var btnName: UIButton!
    @IBOutlet weak var btnImage: UIButton!
    @IBOutlet weak var btnHome: UIButton!
    @IBOutlet weak var btnTransporation: UIButton!
    @IBOutlet weak var btnFood: UIButton!
    @IBOutlet weak var btnLocalPlace: UIButton!
    @IBOutlet weak var btnNightLife: UIButton!
    @IBOutlet weak var btnEvents: UIButton!
    @IBOutlet weak var btnMaps: UIButton!
    
    
    var home :HomeVC!
    var transport : TransportationVC!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        home = (storyboard?.instantiateViewControllerWithIdentifier("HomeVC")) as! HomeVC
        transport = (storyboard?.instantiateViewControllerWithIdentifier("TransportationVC")) as! TransportationVC
        // Do any additional setup after loading the view.

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //MARK: SELF MADE

    func setViewController (VC :UIViewController){
        sideMenuViewController?.contentViewController = VC
        sideMenuViewController?.hideMenuViewController()
    }
    
    //MARK: ACTION BUTTONS
    
    @IBAction func actionBtnProfile(sender: AnyObject) {
    }

    @IBAction func actionBtnHome(sender: AnyObject) {
        setViewController(home)
    }
    
    @IBAction func actionBtnFood(sender: AnyObject) {
        
    }
    
    @IBAction func actionBtnTransportation(sender: AnyObject) {
        setViewController(transport)

    }
    @IBAction func actionBtnName(sender: AnyObject) {
    }
    
    @IBAction func actionBtnMaps(sender: AnyObject) {
    }
    @IBAction func actionBtnLogout(sender: AnyObject) {
    }
    @IBAction func actionBtnSettings(sender: AnyObject) {
    }
    @IBAction func actionBtnLocalPlaces(sender: AnyObject) {
    }
    @IBAction func actionBtnNightLife(sender: AnyObject) {
    }
    @IBAction func actionBtnEvents(sender: AnyObject) {
    }
    
    
    
    
}
