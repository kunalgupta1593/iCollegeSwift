//
//  LoginVC.swift
//  iCollegeSwift
//
//  Created by Kunal Gupta on 16/06/16.
//  Copyright © 2016 Kunal Gupta. All rights reserved.
//

import UIKit

class LoginVC: BaseController,UIAlertViewDelegate,UITextFieldDelegate {
    
    @IBOutlet weak var tfPassword: UITextField!
    @IBOutlet weak var tfUserName: UITextField!
    
    @IBOutlet weak var btnSignIn: UIButton!
    @IBOutlet weak var btnForgotPassword: UIButton!
    var tf = UITextField()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
        checkIfLoggedIn()
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //MARK: SELF MADE
    
    func initialize(){
        tfUserName.attributedPlaceholder = NSAttributedString(string:"Username",attributes:[NSForegroundColorAttributeName: UIColor.whiteColor()])
        tfPassword.attributedPlaceholder = NSAttributedString(string:"Password",attributes:[NSForegroundColorAttributeName: UIColor.init(colorLiteralRed: 255/255, green: 255/255, blue: 255/255, alpha: 1)])
        tfPassword.text = "pppppp"
        tfUserName.text = "kunalg"
    }
    
    func checkIfLoggedIn(){
        if Constant.USER_DICT?.valueForKey("token")?.length != 0{
            let nav = UINavigationController(rootViewController: (storyboard?.instantiateViewControllerWithIdentifier("HomeVC"))!)
            nav.navigationBarHidden = true
            
            let sideMenu = SSASideMenu(contentViewController: nav, leftMenuViewController: (storyboard?.instantiateViewControllerWithIdentifier("SideViewController"))!)
            sideMenu.configure(SSASideMenu.MenuViewEffect(fade: true, scale: true, scaleBackground: false))
            sideMenu.configure(SSASideMenu.ContentViewEffect(alpha: 1.0, scale: 0.7))
            sideMenu.configure(SSASideMenu.ContentViewShadow(enabled: true, color: UIColor.blackColor(), opacity: 0.6, radius: 6.0))
            
            UIApplication.sharedApplication().keyWindow?.rootViewController = sideMenu;
        }
    }
    
    //MARK: ALERT VIEW DELEGATES
    
    func alertView(alertView: UIAlertView, clickedButtonAtIndex buttonIndex: Int) {
        if buttonIndex == 1{
            
        }
    }
    
    //MARK:- TEXT FIELD DELEGATE
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        if tfUserName .isFirstResponder(){
            tfPassword .becomeFirstResponder()
        }
        else if tfPassword.isFirstResponder(){
            view .endEditing(true)
        }
        
        return true
    }
    
    //MARK: TOUCHES BEGAN
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        view .endEditing(true)
    }
    
    
    
    // MARK: - ACTION BUTTONS
    
    @IBAction func actionBtnForgotPassword(sender: AnyObject) {
        let alert = UIAlertView()
        var alert1 : String?
        alert1 = "2"
        print(alert1)
        alert.title = "Forgot password"
        alert.message = "Enter email to recover your password"
        alert.alertViewStyle = UIAlertViewStyle.PlainTextInput
        alert.addButtonWithTitle("Cancel")
        alert.addButtonWithTitle("OK")
        tf = alert.textFieldAtIndex(0)!
        tf.keyboardType = UIKeyboardType.EmailAddress
        
        alert.show()
    }
    @IBAction func actionBtnfacebook(sender: AnyObject) {
        
        
    }
    @IBAction func actionBtnSignUp(sender: AnyObject) {
        navigationController?.pushViewController((storyboard?.instantiateViewControllerWithIdentifier("SignupVC"))!, animated: true)
    }
        
    @IBAction func actionBtnSignIn(sender: AnyObject) {
        
        if tfUserName.text == ""{
            super.showAlert("Enter Username");
        }
        else if tfPassword.text == ""{
            super.showAlert("Enter Password")
        }
        else{
            var dict = [String:AnyObject]()
            dict["username"] = tfUserName.text?.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
            dict["password"] = tfPassword.text
            
//            ApiDetector.getDataOfURL(ApiCollection.apiSignIn, dict: dict, failure: { (error) in
//                print(error)
//                }, success: { (data) in
//                    if(data["success"] as! String == "1"){
//                        print(data)
//                    }
//                }, method: "post", viewControl: self , pic: UIImage())
            
                        HttpManager .callApiWithParameters(ApiCollection.apiSignIn, withParameters: dict, success: { (dict) in
                            if(dict["success"] as? Int == 1){
                                print(dict)
                                
                                NSUserDefaults.standardUserDefaults().setObject(dict["data"], forKey:Constant.iCollegeSwift)

                                let secondViewController = self.storyboard!.instantiateViewControllerWithIdentifier("CollegeListVC") as? CollegeListVC
                                self.navigationController!.pushViewController(secondViewController!, animated: true)

                            }
                            }, failure: { (error) in
                               print(error)
                            }, method: "post", img: UIImage())
        }
        
    }
    
    
}
