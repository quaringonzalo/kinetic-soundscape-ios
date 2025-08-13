//
//  PrimaryType.swift
//  Soundscape
//
//  Copyright (c) Microsoft Corporation.
//  Licensed under the MIT License.
//

import Foundation

enum PrimaryType: String, CaseIterable, Type {
    
    case transit
    case food
    case park
    case bank
    case grocery
    case navilens
    
    func matches(poi: POI) -> Bool {
        guard let typeable = poi as? Typeable else {
            return false
        }
        
        return typeable.isOfType(self)
    }
    
}
