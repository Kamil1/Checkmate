//
//  CMTag.swift
//  Checkmate
//
//  Created by Kamil Khan on 2018-05-11.
//  Copyright © 2018 Kamil Khan. All rights reserved.
//

import Foundation
import UIKit

class CMTag: Hashable {
    var name: String
    var color: UIColor
    var checklists: Set<CMChecklist>
    
    var hashValue: Int {
        return name.hashValue &* 16777619
    }
    
    init(name: String, color: UIColor) {
        self.name = name
        self.color = color
        self.checklists = Set<CMChecklist>()
    }
    
    static func == (lhs: CMTag, rhs: CMTag) -> Bool {
        return lhs.name == rhs.name && lhs.color == rhs.color
    }
}
