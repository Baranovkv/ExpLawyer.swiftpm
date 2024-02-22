//
//  File.swift
//  
//
//  Created by Kirill Baranov on 19/02/24.
//

import Foundation

protocol DraggableItem {
    
    var startBox: String { get set }
    var correctBox: String { get set }
    var currentBox: String { get set }
    
    
    mutating func toStartPosition()
    
}

extension DraggableItem {
    
    mutating func toStartPosition() {
        self.currentBox = self.startBox
    }

    var isCorrectBox: Bool {
        correctBox == currentBox
    }
    
}
