//
//  CMChecklist.swift
//  Checkmate
//
//  Created by Kamil Khan on 2018-05-11.
//  Copyright © 2018 Kamil Khan. All rights reserved.
//

import Foundation

class CMChecklist: CMMetadata {
    var type: CMMetadataType = .list
    
    var name: String
    var items: [CMItem]
    var directory: CMDirectory
    var tags: [CMTag]
    
    init(name: String, directory: CMDirectory) {
        self.name = name
        self.items = [CMItem]()
        self.directory = directory
        self.tags = [CMTag]()
    }
    
}
