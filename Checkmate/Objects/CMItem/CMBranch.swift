//
//  CMBranch.swift
//  Checkmate
//
//  Created by Kamil Khan on 2018-05-11.
//  Copyright © 2018 Kamil Khan. All rights reserved.
//

import Foundation

class CMBranch: CMItem {
    var text: String
    var notes: String
    var checklist: CMChecklist
    
    var state: CMBranchState
    
    var stateChecklist: [CMBranchState : CMChecklist]
    
    init(text: String, notes: String, checklist: CMChecklist) {
        self.text = text
        self.notes = notes
        self.checklist = checklist
        self.stateChecklist = [CMBranchState : CMChecklist]()
        self.state = .unselected
    }
}

enum CMBranchState {
    case yes
    case no
    case unselected
}
