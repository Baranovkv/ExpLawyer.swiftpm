//
//  File.swift
//  
//
//  Created by Kirill Baranov on 18/02/24.
//

import SwiftUI

struct PromissoryNoteView: View {
    
    @EnvironmentObject var loanAgreementVM: LoanAgreementVM
        
    private var spellOutFormatter: Formatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = .spellOut
        return formatter
    }
    
    var body: some View {
        VStack {
            Text("Promissory Note")
                .font(.title)
                .padding(16)
            
            VStack(alignment: .leading) {
                
                FlexibleStack(alignment: .leading) {
                    
                    Text("I,")
                    
                    DropDestinationView(currentBox: "BorrowerName")
                    
                    FlexibleText(", residing at")
                    
                    DropDestinationView(currentBox: "BorrowerAndress")
                    
                    FlexibleText(", (the \"Borrower\"), hereby promise to pay to the order of")
                    
                    DropDestinationView(currentBox: "LenderName")
                    
                    FlexibleText(", residing at ")
                    
                    DropDestinationView(currentBox: "LenderAndress")
                    
                    FlexibleText(", (the \"Lender), the sum of")
                    
                    TextField("<Loan Amount>", value: $loanAgreementVM.loanAmount, format: .currency(code: "USD"))
                        .keyboardType(.decimalPad)
                        .padding(.horizontal)
                        .frame(maxWidth: 175)
                        .background {
                            RoundedRectangle(cornerRadius: 4)
                                .foregroundStyle(.white)
                                .shadow(radius: 1)
                        }
                        .overlay {
                            if loanAgreementVM.showErrors {
                                RoundedRectangle(cornerRadius: 4)
                                    .stroke()
                                    .foregroundStyle(loanAgreementVM.isAmountCorrect ? .green : .red)
                            }
                        }
                    
                    
                    if let loanAmount = loanAgreementVM.loanAmount {
                        FlexibleText("(\(spellOutFormatter.string(for: loanAmount) ?? "[Amount in words]") Dollars), on")
                    } else {
                        FlexibleText("( <Amount in words> Dollars), on")
                    }
                    HStack {
                        DatePicker("dueDate", selection: $loanAgreementVM.dueDate, displayedComponents: .date)
                            .datePickerStyle(.compact)
                            .labelsHidden()
                            .overlay {
                                if loanAgreementVM.showErrors {
                                    RoundedRectangle(cornerRadius: 4)
                                        .stroke()
                                        .foregroundStyle(loanAgreementVM.isDueDateCorrect ? .green : .red)
                                }
                            }
                        Text(".")
                    }
                    
                    
                }
                Text("""

This promissory note is issued pursuant to applicable laws and regulations and is subject to the following terms and conditions:

**Terms and Conditions**:

""")
                FlexibleStack(alignment: .leading) {
                    FlexibleText("1. Interest: The principal amount shall bear an annual interest rate of")
                    
                    TextField("<Rate>", value: $loanAgreementVM.interestsRate, format: .percent)
                        .keyboardType(.decimalPad)
                        .padding(.horizontal)
                        .frame(maxWidth: 100)
                        .background {
                            RoundedRectangle(cornerRadius: 4)
                                .foregroundStyle(.white)
                                .shadow(radius: 1)
                        }
                        .overlay {
                            if loanAgreementVM.showErrors {
                                RoundedRectangle(cornerRadius: 4)
                                    .stroke()
                                    .foregroundStyle(loanAgreementVM.isRateCorrect ? .green : .red)
                            }
                        }
                    
                    FlexibleText("from the date of this promissory note until fully repaid. Interest shall be calculated on the outstanding balance.")
                }
                
                Text("""
2. Payment: The payment shall be made in USD at the address of \(loanAgreementVM.agreementDetails.first(where: { $0.currentBox == "LenderName" } )?.title ?? "<Lender's name>") mentioned above or at such other place as \(loanAgreementVM.agreementDetails.first(where: { $0.currentBox == "LenderName" } )?.title ?? "<Lender's name>") may designate in writing.
3. Maturity Date: The maturity date of this promissory note is \(loanAgreementVM.dueDate.formatted(date: .abbreviated, time: .omitted)), and the entire principal amount shall be payable on or before that date.
4. Prepayment: The Borrower reserves the right to prepay the outstanding principal amount, in whole or in part, at any time without penalty.
5. Default: In the event of default, the Borrower shall be liable for all costs and expenses incurred by the Lender in the enforcement of this promissory note.
6. Contact information and signatures:

""")
                
                HStack {
                    VStack(alignment: .leading) {
                        Text("Borrower: \(loanAgreementVM.agreementDetails.first(where: { $0.currentBox == "BorrowerName" } )?.title ?? "<Borrower's name>")")
                        Text("Phone:")
                        DropDestinationView(currentBox: "BorrowerPhone")
                        
                        Text("Email:")
                        DropDestinationView(currentBox: "BorrowerEmail")
                        
                            .padding(.bottom)
                        
                        Text("____________ signature ")
                    }
                    Spacer()
                    VStack(alignment: .trailing) {
                        Text("Lender: \(loanAgreementVM.agreementDetails.first(where: { $0.currentBox == "LenderName" } )?.title ?? "<Lender's name>")")
                        
                        Text("Phone:")
                        DropDestinationView(currentBox: "LenderPhone")
                        
                        Text("Email:")
                        DropDestinationView(currentBox: "LenderEmail")
                        
                            .padding(.bottom)
                        
                        Text("____________ signature ")
                        
                        
                    }
                    
                }
                Text(Date().formatted(date: .abbreviated, time: .omitted))
                    .padding(.top)
            }
            .font(.title3)
            .lineSpacing(4)
            .padding()
            Spacer()
        }
        .foregroundStyle(.black)
        .overlay {
            Rectangle()
                .stroke(lineWidth: 8)
                .foregroundStyle(.primary)
        }
        .frame(width: 750, height: 1060)
        .padding()
        .background {
            Color.white
                .shadow(radius: 4)
            Rectangle()
                .stroke()
            
            
        }
        .background {
            Group {
                Color.white
                    .shadow(radius: 4)
                Rectangle()
                    .stroke()
            }
            .rotationEffect(.degrees(1), anchor: .bottom)
            
        }
        .background {
            Group {
                Color.white
                    .shadow(radius: 4)
                Rectangle()
                    .stroke()
                
            }
            .rotationEffect(.degrees(2), anchor: .top)
            
        }
    }
}

