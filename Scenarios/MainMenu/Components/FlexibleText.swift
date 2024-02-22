//
//  SwiftUIView.swift
//  
//
//  Created by Kirill Baranov on 13/02/24.
//

import SwiftUI

struct FlexibleText: View {
    
    let text: String
    
    var body: some View {
        ForEach (text.components(separatedBy: " "), id: \.self) { word in
            Text(word)
        }
    }
    
    init(_ text: String) {
        self.text = text
    }
}
