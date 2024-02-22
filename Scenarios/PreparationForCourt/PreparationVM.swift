//
//  File.swift
//
//
//  Created by Kirill Baranov on 19/02/24.
//

import Foundation
import Observation

class PreparationVM: ObservableObject {
    
    var gameVM: GameVM
    
    @Published var items = [
        ItemToCollect(
            id: "text.book.closed",
            title: "Law book",
            description: "For quick reference to legal statutes and precedents",
            correctPlace: .takeIt
        ),
        ItemToCollect(
            id: "books.vertical",
            title: "Case files",
            description: "Refer to documents, evidence, and witness statements.",
            correctPlace: .takeIt
        ),
        ItemToCollect(
            id: "person.text.rectangle",
            title: "Identification",
            description: "Indispensable for legal proceedings.",
            correctPlace: .takeIt
        ),
        ItemToCollect(
            id: "doc.plaintext",
            title: "Power of attorney",
            description: "A document authorizing action on behalf of the client.",
            correctPlace: .takeIt
        ),
        ItemToCollect(
            id: "pencil",
            title: "Pen",
            description: "Often needed for note-taking.",
            correctPlace: .takeIt
        ),
        ItemToCollect(
            id: "note.text",
            title: "Notebook",
            description: "Sometimes you have to write - and even a lot",
            correctPlace: .takeIt
        ),
        ItemToCollect(
            id: "smartphone",
            title: "Mobile phone",
            description: "Where can one even go without this!",
            correctPlace: .takeIt
        ),
        ItemToCollect(
            id: "waterbottle",
            title: "Water bottle",
            description: "In stressful situations, the body needs plenty of water.",
            correctPlace: .takeIt
        ),
        ItemToCollect(
            id: "wineglass",
            title: "Alcohol",
            description: "Will create the wrong impression, not advisable.",
            correctPlace: .leaveIt
        ),
        ItemToCollect(
            id: "shoe.2",
            title: "Sports equipment",
            description: "Not the best time for sports.",
            correctPlace: .leaveIt
        ),
        ItemToCollect(
            id: "birthday.cake",
            title: "Cake",
            description: "Better saved for after a successful court session.",
            correctPlace: .leaveIt
        ),
        ItemToCollect(
            id: "visionpro",
            title: "Vision Pro",
            description: "Cool, but you won't be understood.",
            correctPlace: .leaveIt
        ),
        ItemToCollect(
            id: "gamecontroller",
            title: "Game console",
            description: "The game is not worth the candle.",
            correctPlace: .leaveIt
        ),
        ItemToCollect(
            id: "laptopcomputer",
            title: "Laptop",
            description: "Could be useful if there's enough space.",
            correctPlace: .takeIt
        )
    ]
    
    var isResultsCorrect: Bool {
        items.allSatisfy( { $0.isCorrectPlace == true } )
    }
    
    init(gameVM: GameVM) {
        self.gameVM = gameVM
    }
    
    func saveResult() {
        gameVM.actions[0].isCompleted = self.isResultsCorrect
    }

    
}
