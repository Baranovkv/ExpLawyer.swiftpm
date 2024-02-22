//
//  File.swift
//  
//
//  Created by Kirill Baranov on 19/02/24.
//

import Foundation

struct ItemToCollect: Identifiable, Codable, Hashable {
    
    let id: String
    let title: String
    var priority: Int = 0
    let description: String
    var startPlace: ItemPlace = .leaveIt
    var currentPlace: ItemPlace = .leaveIt
    let correctPlace: ItemPlace
    
    var isCorrectPlace: Bool {
        correctPlace == currentPlace
    }
    
    mutating func toStartPosition() {
        self.currentPlace = self.startPlace
    }
}

enum ItemPlace: String, Codable {
    
    case takeIt
    case leaveIt
    
}
