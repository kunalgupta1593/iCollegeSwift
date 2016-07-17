 
 //
 //  ApiDetector.swift
 //  GoHobo
 //
 //  Created by CBL24pc on 4/9/16.
 //  Copyright © 2016 GCode. All rights reserved.
 //
 
 import UIKit
 import SwiftyJSON
 
 class ApiDetector: NSObject {
    
    //Mark::- Variables
    
    static var SingleUserArray: AnyObject? = ""
    
    //Mark::- Class Functions
    class func getDataOfURL(url: String,dict: NSDictionary, failure: (NSError) ->(), success:(AnyObject)->(), method:String, viewControl: UIViewController, pic: UIImage){
        
        AppLoader.showLoader()
        ApiCaller.sendUserDetailsOfHoboSignUp(url, success: { (response) -> () in
            let data = JSON(response)
            if(data["success"].stringValue == "1"){
                AppLoader.hideLoader()

                switch(url){
                case ApiCollection.apiSignIn:
                    print(url)
                
                default:
                    print(url)
                
                success(SingleUserArray!)
                }
            }
            else{
                AppLoader.hideLoader()
                if(data["msg"].stringValue == "The selected token is invalid."){
                    NSNotificationCenter.defaultCenter().postNotificationName("logOut", object: nil)
                }
                AlertView.callAlertView("Error", msg: "error: \(data["msg"].stringValue)", btnMsg:"OK", vc: viewControl)
            }
            }, failure: { (error) -> () in
                failure(error)
                AppLoader.hideLoader()
                  AlertView.callAlertView("Error", msg: "error: \(error.localizedDescription)", btnMsg:"OK", vc: viewControl)
            }, dict: (dict as? [String : AnyObject])! , method: method, img:pic)
    }
 }
