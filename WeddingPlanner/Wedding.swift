//
//  Wedding.swift
//  WeddingPlanner
//
//  Created by Felipe Assunção on 4/19/16.
//  Copyright © 2016 Felipe Assunção. All rights reserved.
//

import UIKit
import ObjectMapper

class Wedding : Mappable {

    var   id        : String!
        , brideId   : String!
        , groomId   : String!
        , date      : NSDate?
    
    
    init () {

    }
    
    required init?(_ map: Map) {
        
    }
    
    // Mappable
    func mapping(map: Map) {
        id              <- map["_id"]
        brideId         <- map["brideId"]
        groomId         <- map["groomId"]
        date            <- map["date"]
    }
}