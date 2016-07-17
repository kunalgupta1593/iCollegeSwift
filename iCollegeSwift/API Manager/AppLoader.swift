//
//  AppLoader.swift
//  GoHobo
//
//  Created by cbl24 on 4/23/16.
//  Copyright © 2016 GCode. All rights reserved.
//

import UIKit
import SwiftLoader

class AppLoader: NSObject {

    class func showLoader(){
        SwiftLoader.show(animated: true)
    }
    
    class func hideLoader(){
        SwiftLoader.hide()
    }

}
