
//
//  TransportationModel.swift
//  iCollegeSwift
//
//  Created by Kunal Gupta on 18/07/16.
//  Copyright © 2016 Kunal Gupta. All rights reserved.
//

import UIKit
import SwiftyJSON

class TransportationModel: NSObject {

    var strID : String?
    var strName : String?
    var strPhoneNumber : String?
    var strRating : String?
    var strSubCategoryID : String?
    
    init(dict : Dictionary <String, JSON>) {
        super.init()
        strID = dict["id"]?.stringValue
        strName = dict["name"]?.stringValue
        strPhoneNumber = dict["phn_no"]?.stringValue
        strRating = dict["rating"]?.stringValue
        strSubCategoryID = dict["sub_category_id"]?.stringValue
    }
    
    override init(){
        super.init()
    }
    
    static func parseDataArray(array1 : [JSON] ) -> [TransportationModel]{
        var tempArr : [TransportationModel] = []
        for dict in array1 {
            let placeValues = TransportationModel(dict: dict.dictionaryValue)
            tempArr.append(placeValues)
        }
        return tempArr
    }

    
}
