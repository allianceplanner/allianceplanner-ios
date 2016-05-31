//
//  TaskRepository.swift
//  WeddingPlanner
//
//  Created by Felipe Assunção on 5/31/16.
//  Copyright © 2016 Felipe Assunção. All rights reserved.
//

import Foundation

class TaskRepository : GenericRepository<Task> {
    
    override init(address: String!) {
        super.init(address: address)
    }
    
}