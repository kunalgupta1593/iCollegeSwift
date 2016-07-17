//
//  BusVC.swift
//  iCollegeSwift
//
//  Created by Kunal Gupta on 18/07/16.
//  Copyright © 2016 Kunal Gupta. All rights reserved.
//

import UIKit

class BusVC: UIViewController,UIWebViewDelegate {

    @IBOutlet weak var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = NSURL (string: "www.google.com")
        let requestObj = NSURLRequest(URL: url!);
        webView.loadRequest(requestObj)
        webView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func webView(webView: UIWebView, didFailLoadWithError error: NSError?) {
        print(error?.localizedDescription)
    }

}
