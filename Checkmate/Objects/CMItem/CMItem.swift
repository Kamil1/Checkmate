//
//  CMItem.swift
//  Checkmate
//
//  Created by Kamil Khan on 2018-05-11.
//  Copyright © 2018 Kamil Khan. All rights reserved.
//

import Foundation

protocol CMItem {
    var text: String {get}
    var notes: String {get}
    var checklist: CMChecklist {get}
}
