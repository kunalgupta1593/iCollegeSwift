//
//  TaxiVC.swift
//  iCollegeSwift
//
//  Created by Kunal Gupta on 18/07/16.
//  Copyright © 2016 Kunal Gupta. All rights reserved.
//

import UIKit
import SwiftyJSON

class TaxiVC: UIViewController {

    @IBOutlet weak var tableViewTaxi: UITableView!
    
    var arrTableData = [TransportationModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        hitAPI()

    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //MARK: HIT API
    
    func hitAPI(){
        
        var dict = [String:String]()
        let token = Constant.USER_DICT?["token"] as? String
        dict["token"] = token
        
        print(Constant.USER_DICT)
        
        HttpManager.callApiWithParameters(ApiCollection.apitaxi, withParameters: dict, success: { (dict) in
            print(dict)
            
            var jsonResult = JSON(dict)
            if jsonResult["success"].stringValue == "1"{
                
                self.handleSuccess(jsonResult)
            }
            
            }, failure: { (error) in
                print(error)
            }, method: "post", img: UIImage())
    }
    func handleSuccess(json:JSON){
        print(json)
        
        arrTableData = TransportationModel.parseDataArray(json["data"].arrayValue)
        print(arrTableData)
        tableViewTaxi.reloadData()
        
    }
    
    // MARK: - Navigation
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return  arrTableData.count
    }
    func

}
