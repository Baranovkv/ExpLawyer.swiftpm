//
//  File.swift
//
//
//  Created by Kirill Baranov on 18/02/24.
//

import Foundation

struct TestQuestion: Identifiable, Codable {
    
    let id: Int
    let content: String
    let rightAnswer: TestAnswer
    var playerAnswer: TestAnswer?
    
    var isCorrectAnswer: Bool {
        playerAnswer == rightAnswer
    }
    
}

enum TestAnswer: String, Codable, CaseIterable {
    
    case isTrue = "This is true"
    case isFalse = "This is false"
    case notMentioned = "This was not mentioned"
    
}

enum TestStages: Int, Codable, CaseIterable {
    
    case reading = 0, question1, question2, question3, question4, results, preview
    
    mutating func next() {
        let all = Self.allCases
        let index = all.firstIndex(of: self)!
        let next = all.index(after: index)
        self = all[next == all.endIndex ? all.startIndex : next]
    }
    
    mutating func previous() {
        let all = Self.allCases
        let index = all.firstIndex(of: self)!
        let previous = all.index(before: index)
        self = all[previous < all.startIndex ? all.index(before: all.endIndex) : previous]

    }
}
