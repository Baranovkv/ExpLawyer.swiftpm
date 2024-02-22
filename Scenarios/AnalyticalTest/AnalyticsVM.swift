//
//  File.swift
//  
//
//  Created by Kirill Baranov on 18/02/24.
//

import Foundation
import Observation

class AnalyticsVM: ObservableObject {
    
    var gameVM: GameVM
    
    @Published var testStage: TestStages = .preview
    
    let text = """
The Copyright Office, historically a quiet entity, is now under intense scrutiny due to a groundbreaking review of copyright law in the era of artificial intelligence (A.I.). 
The review, prompted by the clash between tech and media industries over A.I.'s use of copyrighted material, will result in three significant reports this year. The central issue is whether A.I. models infringe on copyrights or operate within fair use by utilizing publicly available data. This has led to lawsuits, including one involving The New York Times, as copyright owners seek to regulate tech companies. The Copyright Office's role in this debate is crucial, with implications for legal principles and substantial financial interests. 
The ongoing review has generated widespread attention, with thousands of public comments expressing varying perspectives. The outcome remains uncertain, as technology advances, posing complex challenges and uncertainties in the intersection of copyright law and A.I.
"""
    
    @Published var testQuestions = [
        TestQuestion(
            id: 1,
            content: "The Copyright Office is undergoing a review of copyright law in the era of artificial intelligence.",
            rightAnswer: .isTrue
        ),
        TestQuestion(
            id: 2,
            content: "The clash between tech and media industries over A.I.'s use of copyrighted material has not led to any lawsuits.",
            rightAnswer: .isFalse
        ),
        TestQuestion(
            id: 3,
            content: "The New York Times is involved in a lawsuit related to A.I.'s use of copyrighted material.",
            rightAnswer: .isTrue
        ),
        TestQuestion(
            id: 4,
            content: "Shira Perlmutter, the director of the Copyright Office, stated that they are currently not receiving much attention from the broader general public.",
            rightAnswer: .notMentioned
        )
    ]
    
    @Published var timeLeft = 30
    
    var isResultsCorrect: Bool {
        testQuestions.allSatisfy( { $0.isCorrectAnswer == true } )
    }
    
    init(gameVM: GameVM) {
        self.gameVM = gameVM
    }
    
    func saveResult() {
        gameVM.actions[1].isCompleted = self.isResultsCorrect
    }
}


