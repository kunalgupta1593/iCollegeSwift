//
//  TransportationVC.swift
//  iCollegeSwift
//
//  Created by Kunal Gupta on 18/07/16.
//  Copyright © 2016 Kunal Gupta. All rights reserved.
//

import UIKit

class TransportationVC: UIViewController,UIPageViewControllerDelegate , UIPageViewControllerDataSource {
    
    
    @IBOutlet weak var btnMenu: UIButton!
    @IBOutlet weak var btnBus: UIButton!
    @IBOutlet weak var viewTop: UIView!
    @IBOutlet weak var viewPlaceholder: UIView!
    @IBOutlet weak var btnTaxi: UIButton!
    
    var bus:BusVC!
    var taxi:TaxiVC!
    var pageViewController : UIPageViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialise()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - SELF MADE

    func initialise(){
        bus = self.storyboard?.instantiateViewControllerWithIdentifier("BusVC") as! BusVC
        taxi = self.storyboard?.instantiateViewControllerWithIdentifier("TaxiVC") as! TaxiVC
        
        addPageViewController()
    }

    func addPageViewController(){
        
        pageViewController = UIPageViewController(transitionStyle: .Scroll, navigationOrientation: .Horizontal, options: nil)
        pageViewController.setViewControllers([bus], direction: .Forward, animated: false, completion: nil)
        pageViewController?.view.frame = CGRect(x: 0, y: 0, width: viewPlaceholder.frame.size.width, height: viewPlaceholder.frame.size.height)
        
        pageViewController.delegate = self
        pageViewController.dataSource = self
        addChildViewController(pageViewController)
        viewPlaceholder .addSubview(pageViewController.view)
    }

    //MARK: PAGE VIEW CONTROLLER DELEGATES AND DATA SOURCES
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        if viewController .isKindOfClass(TaxiVC){
            return bus
        }
        else{
            return nil
        }
    }
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        if viewController.isKindOfClass(BusVC){
            return taxi
        }
        else{
            return nil
        }

    }
    // MARK: - ACTION BUTTONS

    
    @IBAction func actionBtnBus(sender: AnyObject) {
        pageViewController.setViewControllers([bus], direction: .Reverse, animated: true, completion: nil)
    }
    
    @IBAction func actionBtnTaxi(sender: AnyObject) {
        pageViewController.setViewControllers([taxi], direction: .Forward, animated: true, completion: nil)
    }

    @IBAction func actionBtnMenu(sender: AnyObject) {
    }
}
