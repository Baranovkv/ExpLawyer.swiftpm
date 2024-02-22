//
//  File.swift
//  
//
//  Created by Kirill Baranov on 11/02/24.
//

import Foundation

class LoanAgreementVM: ObservableObject {
    
    var gameVM: GameVM
    
    @Published var agreementDetails: [AgreementDetail] = [
        AgreementDetail(
            title: "Richard Roe",
            startBox: "Lender",
            correctBox: "LenderName",
            currentBox: "Lender"
        ),
        AgreementDetail(
            title: "123 Sunny Lane, Apartment 4C, Pleasantville, NY 56789",
            startBox: "Lender",
            correctBox: "LenderAndress",
            currentBox: "Lender"
        ),
        AgreementDetail(
            title: "RichardRoe@example.com",
            startBox: "Lender",
            correctBox: "LenderEmail",
            currentBox: "Lender"
        ),
        AgreementDetail(
            title: "(555) 123-4567",
            startBox: "Lender",
            correctBox: "LenderPhone",
            currentBox: "Lender"
        ),
        AgreementDetail(
            title: "Jane Doe",
            startBox: "Borrower",
            correctBox: "BorrowerName",
            currentBox: "Borrower"
        ),
        AgreementDetail(
            title: "456 Oak Street, Suite 789, Serenity City, NY 67890",
            startBox: "Borrower",
            correctBox: "BorrowerAndress",
            currentBox: "Borrower"
        ),
        AgreementDetail(
            title: "JaneDoe@example.com",
            startBox: "Borrower",
            correctBox: "BorrowerEmail",
            currentBox: "Borrower"
        ),
        AgreementDetail(
            title: "(555) 987-6543",
            startBox: "Borrower",
            correctBox: "BorrowerPhone",
            currentBox: "Borrower"
        ),
        AgreementDetail(
            title: "2000 $",
            startBox: "Terms", 
            correctBox: "Value",
            currentBox: "Terms"
        ),
        AgreementDetail(
            title: "10 %",
            startBox: "Terms",
            correctBox: "Percent",
            currentBox: "Terms"
        )
    ]
    
    @Published var loanAmount: Double?
    @Published var interestsRate: Double?
    @Published var showErrors = false
    @Published var dueDate = Date()
    
    var isAmountCorrect: Bool {
        loanAmount == 2000.0
    }
    
    var isRateCorrect: Bool {
        interestsRate == 0.1
    }
    
    var isDueDateCorrect: Bool {
        let currentDate = Date()
        var dateComponents = DateComponents()
        dateComponents.year = 2
        let correctDate = Calendar.current.date(byAdding: dateComponents, to: currentDate)
        let result = Calendar.current.compare(dueDate, to: correctDate ?? .distantFuture, toGranularity: .day)
        let isSameDay = result == .orderedSame
        return isSameDay
    }
    
    var isResultsCorrect: Bool {
        agreementDetails.allSatisfy( { $0.isCorrectBox == true } ) && (isAmountCorrect) && (isRateCorrect) && (isDueDateCorrect)
    }
    
    
    init(gameVM: GameVM) {
        self.gameVM = gameVM
    }
    
    func saveResult() {
        
        gameVM.actions[2].isCompleted = self.isResultsCorrect
        
    }
    
}
