//
//  ResultItem.swift
//  D214Trainer
//
//  Created by Ali Alchikh Ibrahim on 5/16/25.
//

import Foundation

struct ResultItem: Identifiable {
    let id = UUID()
    let skillDescription: String
    let skillType: String
    let skillCategory: String
    let skillTitle: String
    let videoLink: String?
    let steps: [Step]?
}

struct Step: Identifiable {
    let id = UUID()
    var text: String
    var question: String?
    var img: String?
    var answers: [String]?
    var correctAnswer: String?
}
