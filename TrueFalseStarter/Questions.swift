//
//  Questions.swift
//  TrueFalseStarter
//
//  Created by Daniel Lambrecht on 19/02/2017.
//  Copyright © 2017 Treehouse. All rights reserved.
//

import Foundation

class Question {
    var question: String
    var answer: String
    
    init(question: String, answer: String) {
        self.question = question
        self.answer = answer
    }
}



let question1 = Question.init(question: "Only female koalas can whistle", answer: "False")
let question2 = Question.init(question: "Blue whales are technically whales", answer: "True")
let question3 = Question.init(question: "Camels are cannibalistic", answer: "False")
let question4 = Question.init(question: "All ducks are birds", answer: "True")
