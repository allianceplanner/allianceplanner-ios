//
//  Task.swift
//  WeddingPlanner
//
//  Created by Felipe Assunção on 4/19/16.
//  Copyright © 2016 Felipe Assunção. All rights reserved.
//

import UIKit
import ObjectMapper

class Task : Mappable {
    
    var   id        : String!
    , weddingId     : String!
    , name          : String!
    , description   : String!
    , dueDate       : NSDate?
    , done          : Bool!
    
    
    
    init () {
        
    }
    
    required init?(_ map: Map) {
        
    }
    
    // Mappable
    func mapping(map: Map) {
        id              <- map["_id"]
        weddingId       <- map["weddingId"]
        name            <- map["name"]
        description     <- map["description"]
        dueDate         <- map["dueDate"]
        done            <- map["done"]
    }
}

