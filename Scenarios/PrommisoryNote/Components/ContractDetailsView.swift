//
//  SwiftUIView.swift
//
//
//  Created by Kirill Baranov on 11/02/24.
//

import SwiftUI

struct ContractDetailsView: View {
    
    var detailType: String
    var agreementDetails: [AgreementDetail]
    
    var body: some View {
        
        
        VStack(alignment: .leading) {
            Text(detailType + " details:")
                .font(.title3)
                .bold()
            
            FlexibleStack(alignment: .leading) {
                ForEach (agreementDetails) { detail  in
                    DetailComponent(detail: detail)
                        .padding(2)
                }
                Spacer()
            }
            .padding()
            .frame(width: 300, height: 170)
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
