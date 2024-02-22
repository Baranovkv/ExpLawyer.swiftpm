//
//  SwiftUIView.swift
//
//
//  Created by Kirill Baranov on 21/02/24.
//

import SwiftUI
import UniformTypeIdentifiers

struct TermsView: View {
    
    let value = "2000"
    let percent = "10"
    
    var body: some View {
        
        VStack(alignment: .leading) {
            Text("Agreement terms:")
                .font(.title3)
                .bold()
            VStack(alignment: .leading) {
                Text("Loan amount: \(value)$")
                    .padding(2)
                    .background {
                        RoundedRectangle(cornerRadius: 4)
                            .foregroundStyle(.white)
                            .shadow(radius: 1)
                    }
                    .draggable(value)
                Text("Interests: \(percent)$")
                    .padding(2)
                    .background {
                        RoundedRectangle(cornerRadius: 4)
                            .foregroundStyle(.white)
                            .shadow(radius: 1)
                    }
                    .draggable(percent)
                Text("Loan term: 2 years (set in the date picker)")
            }
            .padding()
            .frame(maxWidth: 300, alignment: .leading)
            .background {
                RoundedRectangle(cornerRadius: 16)
                    .foregroundStyle(.thinMaterial)
                    .shadow(radius: 10)
            }
            .overlay {
                RoundedRectangle(cornerRadius: 16)
                    .stroke()
            }
        }

    }
}

#Preview {
    TermsView()
}
