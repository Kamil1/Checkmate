//
//  CMChecklist.swift
//  Checkmate
//
//  Created by Kamil Khan on 2018-05-11.
//  Copyright © 2018 Kamil Khan. All rights reserved.
//

import Foundation

class CMChecklist: Hashable {
    var name: String
    var items: [CMItem]
    var directory: CMDirectory
    var tags: Set<CMTag>
    
    var hashValue: Int {
        return name.hashValue ^ directory.hashValue &* 16777619
    }
    
    init(name: String, directory: CMDirectory) {
        self.name = name
        self.items = [CMItem]()
        self.directory = directory
        self.tags = Set<CMTag>()
    }
    
    static func == (lhs: CMChecklist, rhs: CMChecklist) -> Bool {
        return lhs.name == rhs.name && lhs.directory == rhs.directory
    }
}
