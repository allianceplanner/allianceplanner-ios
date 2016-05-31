//
//  LocalStorageProvider.swift
//  WeddingPlanner
//
//  Created by Felipe Assunção on 5/27/16.
//  Copyright © 2016 Felipe Assunção. All rights reserved.
//

import Foundation

public class LocalStorageProvider<T> {

    var storageKey      = "wedding-planner-storage"
    var userDefaults    = NSUserDefaults.standardUserDefaults()
    var storage         = NSUUID().UUIDString
    
    init(storage : String){
        self.storage = storage
    }
    
    func syncronize (data : AnyObject) {
        let myData = NSKeyedArchiver.archivedDataWithRootObject(data)
        NSUserDefaults.standardUserDefaults().setObject(myData, forKey: "\(storageKey)-\(storage)")
        NSUserDefaults.standardUserDefaults().synchronize()
    }
    
    func restore<T> () -> T? {
        if let raw = NSUserDefaults.standardUserDefaults().dataForKey("\(storageKey)-\(storage)") {
            if let result = NSKeyedUnarchiver.unarchiveObjectWithData(raw) as? T{
                return result
            }
        }
        return nil
    }
    
    
//    static func syncronize () {
////        let myData = NSKeyedArchiver.archivedDataWithRootObject(RecipeManager.recipes)
////        NSUserDefaults.standardUserDefaults().setObject(myData, forKey: "recipearray")
////        NSUserDefaults.standardUserDefaults().synchronize()
//    }
//    
//    static func initalizeDefaults () {
//        if let recipesRaw = NSUserDefaults.standardUserDefaults().dataForKey(storageKey) {
//            if let recipes = NSKeyedUnarchiver.unarchiveObjectWithData(recipesRaw) as? [Recipe]{
//                RecipeManager.recipes = recipes
//            }
//        }
//    }

}