//
//  CMTask.swift
//  Checkmate
//
//  Created by Kamil Khan on 2018-05-11.
//  Copyright © 2018 Kamil Khan. All rights reserved.
//

import Foundation

class CMTask: CMItem {
    var text: String
    var notes: String
    var checklist: CMChecklist
    
    var isCompleted: Bool
    
    init(text: String, notes: String, checklist: CMChecklist) {
        self.text = text
        self.notes = notes
        self.checklist = checklist
        isCompleted = false
    }
}
