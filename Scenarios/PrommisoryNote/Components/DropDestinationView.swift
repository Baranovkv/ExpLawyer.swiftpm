//
//  SwiftUIView.swift
//  
//
//  Created by Kirill Baranov on 14/02/24.
//

import SwiftUI

struct DropDestinationView: View {
    
    @EnvironmentObject var loanAgreementVM: LoanAgreementVM
    
    let currentBox: String
    
    var body: some View {

        VStack {
            if let item = loanAgreementVM.agreementDetails.first(where: { $0.currentBox == currentBox } ) {
                if loanAgreementVM.showErrors {
                    DetailComponent(detail: item)
                        .bold()
                        .overlay {
                            RoundedRectangle(cornerRadius: 4)
                                .stroke()
                                .foregroundStyle(item.isCorrectBox ? .green : .red)
                        }
                        
                } else {
                    DetailComponent(detail: item)
                        .bold()
                }
                
            } else {
                
                VStack {
                    
                }
                .frame(minWidth: 100, minHeight: 28)
                .background {
                        RoundedRectangle(cornerRadius: 4)
                            .foregroundStyle(.white)
                            .shadow(radius: 1)
                    if loanAgreementVM.showErrors {
                        
                        RoundedRectangle(cornerRadius: 4)
                            .stroke()
                            .foregroundStyle(.red)
                    
                    }
                }
            }
        }
        
        .dropDestination(for: String.self) { items, location in
            for item in items {
                if let currentLenderNameIndex =  loanAgreementVM.agreementDetails.firstIndex(where: { $0.currentBox == currentBox }) {
                    loanAgreementVM.agreementDetails[currentLenderNameIndex].toStartPosition()
                }
                if let newLenderNameIndex = loanAgreementVM.agreementDetails.firstIndex(where: { $0.title == item }) {
                    loanAgreementVM.agreementDetails[newLenderNameIndex].currentBox = currentBox
                }
            }
            
            return true
        }
        
    }
}

//#Preview {
//    DropDestinationView(currentBox: "LenderName")
//}
