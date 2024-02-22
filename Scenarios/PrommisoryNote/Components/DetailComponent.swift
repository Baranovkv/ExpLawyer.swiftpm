//
//  SwiftUIView.swift
//
//
//  Created by Kirill Baranov on 11/02/24.
//

import SwiftUI

struct DetailComponent: View {
        
    var detail: AgreementDetail
    
    var body: some View {
        Text(detail.title)
            .padding(1)
            .background {
                RoundedRectangle(cornerRadius: 4)
                    .foregroundStyle(.white)
                    .shadow(radius: 1)
            }
            .draggable(detail.title)
    }
}
