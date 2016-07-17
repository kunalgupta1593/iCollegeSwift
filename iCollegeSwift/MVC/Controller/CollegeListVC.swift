//
//  CollegeListVC.swift
//  iCollegeSwift
//
//  Created by cbl20 on 6/23/16.
//  Copyright © 2016 Kunal Gupta. All rights reserved.
//

import UIKit
import SwiftyJSON

class CollegeListVC: UIViewController,UITableViewDataSource , UITableViewDelegate,SSASideMenuDelegate {
    
    @IBOutlet weak var btnBack: UIButton!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableViewCollege: UITableView!
    @IBOutlet weak var viewTop: UIView!
    @IBOutlet weak var btnDone: UIButton!
    
    var arrTableData = [CollegeListModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        initlaise()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //MARK: SELF MADE
    
    func initlaise(){
        hitAPI()
    }
    
    //MARK: HIT API
    
    func hitAPI(){
        var dict = [String:String]()

        print(Constant.USER_DICT)

        dict["token"] = Constant.USER_DICT?["token"] as? String
       
        HttpManager.callApiWithParameters(ApiCollection.apiCollegeList, withParameters: dict, success: { (dict) in
            print(dict)
            
            var jsonResult = JSON(dict)
            
            if jsonResult["success"].stringValue == "1"{
         
                self.handleSuccess(jsonResult)
            }
            }, failure: { (err
                ) in
                print(err)
            }, method: "post", img:UIImage())
    }
    
    func handleSuccess(json:JSON){
        print(json)
        
        arrTableData = CollegeListModel.parseDataArray(json["data"].arrayValue)
        print(arrTableData)
        tableViewCollege.reloadData()

    }
    
    // MARK: - TABLE VIEW DELEGATE AND DATA SOURCES
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrTableData.count ?? 0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
//        var model = arrTableData[indexPath.row]
//        guard let cell = tableView .dequeueReusableCellWithIdentifier("CollegeTableViewCell") else {return UITableViewCell()}
        let cell = tableView.dequeueReusableCellWithIdentifier("CollegeTableViewCell") as! CollegeTableViewCell
        cell.labelCollegeName.text = arrTableData[indexPath.row].strCollegeName
        
        return cell
    }
    
    //MARK: ACTION BUTTONS
    
    @IBAction func actionBtnDone(sender: AnyObject) {

        let nav = UINavigationController(rootViewController: (storyboard?.instantiateViewControllerWithIdentifier("HomeVC"))!)
        nav.navigationBarHidden = true
        
        let sideMenu = SSASideMenu(contentViewController: nav, leftMenuViewController: (storyboard?.instantiateViewControllerWithIdentifier("SideViewController"))!)
        sideMenu.configure(SSASideMenu.MenuViewEffect(fade: true, scale: true, scaleBackground: false))
        sideMenu.configure(SSASideMenu.ContentViewEffect(alpha: 1.0, scale: 0.7))
        sideMenu.configure(SSASideMenu.ContentViewShadow(enabled: true, color: UIColor.blackColor(), opacity: 0.6, radius: 6.0))
        sideMenu.delegate = self

        UIApplication.sharedApplication().keyWindow?.rootViewController = sideMenu;

    }

    @IBAction func actionBtnback(sender: AnyObject) {
        self.navigationController?.popViewControllerAnimated(true)
    }
}
