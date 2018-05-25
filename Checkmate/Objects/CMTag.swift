//
//  CMTag.swift
//  Checkmate
//
//  Created by Kamil Khan on 2018-05-11.
//  Copyright © 2018 Kamil Khan. All rights reserved.
//

import Foundation
import UIKit

class CMTag: CMMetadata {
    var name: String
    var type: CMMetadataType
    
    var color: UIColor
    var checklists: [CMChecklist]
        
    init(name: String, color: UIColor) {
        self.name = name
        self.type = .tag
        self.color = color
        self.checklists = [CMChecklist]()
    }
    
    func set(checklists: [CMChecklist]) {
        self.checklists = checklists
    }

}
