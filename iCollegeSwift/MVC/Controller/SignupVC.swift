//
//  SignupVC.swift
//  iCollegeSwift
//
//  Created by cbl20 on 6/17/16.
//  Copyright © 2016 Kunal Gupta. All rights reserved.
//

import UIKit

class SignupVC: UIViewController,UITextFieldDelegate,UIActionSheetDelegate,UIImagePickerControllerDelegate {

    //     MARK: OUTLETS
    
    @IBOutlet weak var btnBack: UIButton!
    @IBOutlet weak var btnImage: UIButton!
    @IBOutlet weak var btnDone: UIButton!
    @IBOutlet weak var tfName: UITextField!
    @IBOutlet weak var tfEmail: UITextField!
    @IBOutlet weak var tfUsername: UITextField!
    @IBOutlet weak var tfPhoneNumber: UITextField!
    @IBOutlet weak var tfPassword: UITextField!
    @IBOutlet weak var tfGender: UIButton!
    @IBOutlet weak var tfBirthaday: UIButton!
    
    @IBOutlet weak var btnSignIn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //     MARK: SELF MADE
    func initialize(){
        
    }

    //MARK: TEXTFIELD DELEGATES

    func textFieldShouldReturn(textField: UITextField) -> Bool {
        if tfUsername.isFirstResponder(){
        tfEmail.becomeFirstResponder()
        }
        else if tfEmail.isFirstResponder(){
            tfUsername .becomeFirstResponder()
        }
        else if tfEmail .isFirstResponder(){
            tfPhoneNumber .becomeFirstResponder()
        }
        
        return true
    }
    
    //MARK:- IMAGE PICKER DELEGATE
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        print(info)
    }
    
    //     MARK: ACTION BUTTON
    
    @IBAction func actionBtnDone(sender: AnyObject) {
    }
    
    @IBAction func actionBtnImage(sender: AnyObject) {
        let action = UIActionSheet()
        action.tag = 1
        action.addButtonWithTitle("Take Photo")
        action.addButtonWithTitle("Choose from gallery")
        action.addButtonWithTitle("Cancel")
        action.cancelButtonIndex = 2
        action.title = "Gender"
        action.showInView(view)

    }
    
    @IBAction func actionBtnBack(sender: AnyObject) {
        navigationController?.popViewControllerAnimated(true)
    }
    
    @IBAction func actionBtnBirthday(sender: AnyObject) {
        
    }
    
    @IBAction func actionBtnSignIn(sender: AnyObject) {
        navigationController?.popViewControllerAnimated(true)
   
    }
    @IBAction func actionBtnGender(sender: AnyObject) {
        let action = UIActionSheet()
        action.tag = 0
        action.addButtonWithTitle("Male")
        action.addButtonWithTitle("Female")
        action.addButtonWithTitle("Cancel")
        action.cancelButtonIndex = 2
        action.title = "Gender"
        action.showInView(view)

    }


}
