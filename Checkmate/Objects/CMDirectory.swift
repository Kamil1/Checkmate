//
//  CMDirectory.swift
//  Checkmate
//
//  Created by Kamil Khan on 2018-05-11.
//  Copyright © 2018 Kamil Khan. All rights reserved.
//

import Foundation

class CMDirectory: CMMetadata {
    var type: CMMetadataType = .directory
    
    var name: String
    var parent: CMDirectory?
    var items: [CMMetadata]
    
    init(name: String, parent: CMDirectory?) {
        self.name = name
        self.parent = parent
        self.items = [CMMetadata]()
    }
    
    func set(items: [CMMetadata]) {
        self.items = items
    }
}
