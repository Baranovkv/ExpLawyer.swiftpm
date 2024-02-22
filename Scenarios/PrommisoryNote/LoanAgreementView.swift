//
//  SwiftUIView.swift
//
//
//  Created by Kirill Baranov on 11/02/24.
//

import SwiftUI
import TipKit

struct LoanAgreementView: View {
    @Environment (\.dismiss) var dismiss
    @StateObject var loanAgreementVM: LoanAgreementVM
    @State var showConfirmError = false
    @State var gameCompleted = false
    
    private let detailsTip = GameTip(title: Text("Drag the data from these cards into the empty fields of the document."))
    
    
    var body: some View {
        VStack {
            
            HStack {
                
                VStack(alignment: .trailing, spacing: 10) {
                    ContractDetailsView(detailType: "Borrower", agreementDetails: loanAgreementVM.agreementDetails.filter( { $0.currentBox == "Borrower" } ))
                    ContractDetailsView(detailType: "Lender", agreementDetails: loanAgreementVM.agreementDetails.filter( { $0.currentBox == "Lender" } ))
                    
                    TermsView()
                    Spacer()
                }
                .popoverTip(detailsTip)
                
                ScrollView(showsIndicators: false) {
                    VStack(alignment: .leading) {
                        
                        PromissoryNoteView()
                    }
                    .frame(maxWidth: 900)
                    .padding()
                    .padding(.bottom, 64)
                }
            }
            
        }
        .padding()
        .alert("Great job!", isPresented: $gameCompleted, actions: {
            Button("Continue") {
                dismiss()
            }
        }, message: {
            Text("You've drafted an excellent document")
        })
        .alert("You have some mistakes", isPresented: $showConfirmError, actions: {
            Button("I got it!") {
                loanAgreementVM.showErrors = true
            }
        }, message: {
            Text("Document fields with mistakes are highlighted in red")
        })
        
        .toolbar {
            ToolbarItem(placement: .confirmationAction) {
                Button(action: {
                    if loanAgreementVM.isResultsCorrect {
                        loanAgreementVM.saveResult()
                        gameCompleted.toggle()
                    } else {
                        showConfirmError = true
                    }
                }, label: {
                    Text("Confirm")
                        .padding(4)
                        .frame(width: 90)
                        .foregroundStyle(.primary)
                        .background {
                            RoundedRectangle(cornerRadius: 8)
                                .foregroundStyle(.ultraThickMaterial)
                                .shadow(radius: 4)
                            
                        }
                        .overlay {
                            RoundedRectangle(cornerRadius: 8)
                                .stroke()
                                .foregroundStyle(.gray)
                        }
                })
                .buttonStyle(.plain)
                
            }
            
        }
        
        
        
        .navigationBarTitle("Draft the document")
        .navigationBarTitleDisplayMode(.inline)
        .environmentObject(loanAgreementVM)
        .preferredColorScheme(.light)
    }
    
    var body1: some View {
        VStack {
            ScrollView(showsIndicators: false) {
                VStack(alignment: .leading) {
                    Text("Fill in the details of the parties (drag and drop items) and the terms of the loan agreement")
                        .padding(4)
                        .font(.title2)
                        .overlay(
                            Rectangle()
                                .frame(width: 4, height: nil, alignment: .leading)
                                .foregroundColor(Color.primary),
                            alignment: .leading)
                    
                    VStack {
                        HStack(spacing: 12) {
                            ContractDetailsView(detailType: "Borrower", agreementDetails: loanAgreementVM.agreementDetails.filter( { $0.currentBox == "Borrower" } ))
                            ContractDetailsView(detailType: "Lender", agreementDetails: loanAgreementVM.agreementDetails.filter( { $0.currentBox == "Lender" } ))
                        }
                        TermsView()
                    }
                    .popoverTip(detailsTip)
                    .padding(.vertical)
                    Spacer()
                    
                    //MARK: Promissory Note
                    
                    PromissoryNoteView()
                }
                .frame(maxWidth: 900)
                .padding()
                .padding(.bottom, 64)
            }
            .alert("Great job!", isPresented: $gameCompleted, actions: {
                Button("Continue") {
                    dismiss()
                }
            }, message: {
                Text("You've drafted an excellent document")
            })
            .alert("You have some mistakes", isPresented: $showConfirmError, actions: {
                Button("I got it!") {
                    loanAgreementVM.showErrors = true
                }
            }, message: {
                Text("Document fields with mistakes are highlighted in red")
            })
            
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button(action: {
                        if loanAgreementVM.isResultsCorrect {
                            loanAgreementVM.saveResult()
                            gameCompleted.toggle()
                        } else {
                            showConfirmError = true
                        }
                    }, label: {
                        Text("Confirm")
                            .padding(4)
                            .frame(width: 90)
                            .foregroundStyle(.primary)
                            .background {
                                RoundedRectangle(cornerRadius: 8)
                                    .foregroundStyle(.ultraThickMaterial)
                                    .shadow(radius: 4)
                                
                            }
                            .overlay {
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke()
                                    .foregroundStyle(.gray)
                            }
                    })
                    .buttonStyle(.plain)
                    
                }
                
            }
            
            
        }
        .navigationBarTitle("Draft the document")
        .navigationBarTitleDisplayMode(.inline)
        .environmentObject(loanAgreementVM)
        .preferredColorScheme(.light)
    }
    
}

#Preview {
    LoanAgreementView(loanAgreementVM: LoanAgreementVM(gameVM: GameVM()))
}

