//
//  File.swift
//  
//
//  Created by Kirill Baranov on 11/02/24.
//

import Foundation
import SwiftUI

struct GameAction: Identifiable, Codable, Hashable {
    
    var id: String
    var title: String
    let shortTitle: String
    let description: [String]
    let iconName: String
    
    var isCompleted: Bool = false
    
}
