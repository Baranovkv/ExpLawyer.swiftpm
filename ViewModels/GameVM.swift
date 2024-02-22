//
//  File.swift
//  
//
//  Created by Kirill Baranov on 11/02/24.
//

import Foundation

class GameVM: ObservableObject {
            
    @Published var actions: [GameAction] = [
        GameAction(
            id: "paralegal_sorting",
            title: "Preparation for a court hearing",
            shortTitle: "Preparation",
            description: [
                "Lawyers often participate in court hearings and must come well-prepared.",
                "So, let's start with a relatively simple but very important and responsible action for a lawyer - preparing for participation in a court hearing.", 
                "It is crucial to be careful and attentive because even if you draft excellent documents or find irrefutable evidence, forgetting them in the office can lead to significant problems."
            ],
            iconName: "bag"
        ),
        GameAction(
            id: "paralegal_research", 
            title: "Analyse information", 
            shortTitle: "Analytics",
            description: [
                "One of the key skills for a lawyer at any level is the ability to effectively analyze a large amount of information: legal documents, judicial and legislative acts, circumstances of the case, etc.",
                "In this task, you will be given some time to read a short text, and then answer a few questions based on what you have read."
            ],
            iconName: "books.vertical"
        ),
        GameAction(
            id: "paralegal_drafting",
            title: "Drafting of legal documents",
            shortTitle: "Drafting",
            description: [
                "Document drafting is a daily bread-and-butter activity for lawyer.",
                "So lets try to draft an interesting document - a Promissory Note, formalizing a very common financial relationship - a loan.",
                "The promissory note stands out as a popular document that falls between the informality of an “IOU” and the complexity of a loan agreement.",
                "The Promissory Note regulation is fairly uniform in many countries and is based on the Convention Providing a Uniform Law for Bills of Exchange and Promissory Notes (Geneva, June 7, 1930)."
            ],
            iconName: "book.pages"
        )
    ]
}
