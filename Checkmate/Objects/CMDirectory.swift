//
//  CMDirectory.swift
//  Checkmate
//
//  Created by Kamil Khan on 2018-05-11.
//  Copyright © 2018 Kamil Khan. All rights reserved.
//

import Foundation

class CMDirectory: Hashable {
    var name: String
    var parent: CMDirectory?
    var children: [CMDirectory] // TODO: CMDirectory & CMChecklist should implement "CMFile". Both be in same "contents" field.
    var checklists: [CMChecklist]
    
    var hashValue: Int {
        return (parent == nil ? name.hashValue : name.hashValue ^ parent!.hashValue) &* 16777619
    }
    
    init(name: String, parent: CMDirectory) {
        self.name = name
        self.parent = parent
        self.children = [CMDirectory]()
        self.checklists = [CMChecklist]()
    }
    
    static func == (lhs: CMDirectory, rhs: CMDirectory) -> Bool {
        return lhs.name == rhs.name && lhs.parent == rhs.parent
    }
}
