//
//  GenericRepository.swift
//  WeddingPlanner
//
//  Created by Felipe Assunção on 4/21/16.
//  Copyright © 2016 Felipe Assunção. All rights reserved.
//

import Foundation
import ObjectMapper

class GenericRepository<T: Mappable>  {
    
    private var address : String!
  
    init(address: String!) {
        self.address = address
    }
    
    func insert (entity : T) -> T {
        let json = Mapper().toJSONString(entity, prettyPrint: true)
        let raw = NSDataProvider.LoadFromUri(address, method: "POST", json: json)
        let result = Mapper<T>().map(raw)
        return result!
    }
    
    func list () -> Array<T>? {
        let raw = NSDataProvider.LoadFromUri(address)
        let list = Mapper<T>().mapArray(raw)
        return list
    }
    
    func load (id : String) -> T? {
        let uri = "\(address)/\(id)"
        let raw = NSDataProvider.LoadFromUri(uri)
        let entity = Mapper<T>().map(raw)
      return entity
    }
}