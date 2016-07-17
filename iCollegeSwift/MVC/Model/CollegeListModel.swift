//
//  CollegeListModel.swift
//  iCollegeSwift
//
//  Created by cbl20 on 6/24/16.
//  Copyright © 2016 Kunal Gupta. All rights reserved.
//

import UIKit
import SwiftyJSON

class CollegeListModel: NSObject {

    var strCollegeID : String?
    var strCollegeName : String?

    init(dict : Dictionary <String, JSON>) {
        super.init()
        strCollegeID = dict["id"]?.stringValue
        strCollegeName = dict["name"]?.stringValue
    }
    
    override init(){
        super.init()
    }
   
    static func parseDataArray(array1 : [JSON] ) -> [CollegeListModel]{
        var tempArr : [CollegeListModel] = []
        for dict in array1 {
            let placeValues = CollegeListModel(dict: dict.dictionaryValue)
            tempArr.append(placeValues)
        }
        return tempArr
    }
}
