//
//  CMMetadata.swift
//  Checkmate
//
//  Created by Kamil Khan on 2018-05-14.
//  Copyright © 2018 Kamil Khan. All rights reserved.
//

import Foundation

protocol CMMetadata {
    var name: String { get }
    var type: CMMetadataType { get }
}

enum CMMetadataType {
    case list
    case directory
    case tag
}
