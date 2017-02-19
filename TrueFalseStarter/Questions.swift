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
    
    var option1: String
    var option2: String
    var option3: String
    var option4: String
    
    var answer: Int
    
    init(question: String, option1: String, option2: String, option3: String, option4: String, answer: Int) {
        self.question = question
        self.option1 = option1
        self.option2 = option2
        self.option3 = option3
        self.option4 = option4
        self.answer = answer
    }
}



let question1 = Question.init(question: "This was the only US President to serve more than two consecutive terms.", option1: "George Washington", option2: "Franklin D. Roosevelt", option3: "Woodrow Wilson", option4: "Andrew Jackson", answer: 2)
let question2 = Question.init(question: "Which of the following countries has the most residents?", option1: "Nigeria", option2: "Russia", option3: "Iran", option4: "Vietnam", answer: 1)
let question3 = Question.init(question: "In what year was the United Nations founded?", option1: "1918", option2: "1919", option3: "1945", option4: "1954", answer: 3)
let question4 = Question.init(question: "The Titanic departed from the United Kingdom, where was it supposed to arrive?", option1: "Paris", option2: "Washington D.C.", option3: "New York City", option4: "Boston", answer: 3)
let question5 = Question.init(question: "Which nation produces the most oil?", option1: "Iran", option2: "Iraq", option3: "Brazil", option4: "Canada", answer: 4)
let question6 = Question.init(question: "Which country has most recently won consecutive World Cups in Soccer?", option1: "Italy", option2: "Brazil", option3: "Argetina", option4: "Spain", answer: 2)
let question7 = Question.init(question: "Which of the following rivers is longest?", option1: "Yangtze", option2: "Mississippi", option3: "Congo", option4: "Mekong", answer: 2)
let question8 = Question.init(question: "Which city is the oldest?", option1: "Mexico City", option2: "Cape Town", option3: "San Juan", option4: "Sydney", answer: 1)
let question9 = Question.init(question: "Which country was the first to allow women to vote in national elections?", option1: "Poland", option2: "United States", option3: "Sweden", option4: "Senegal", answer: 1)
let question10 = Question.init(question: "Which of these countries won the most medals in the 2012 Summer Games?", option1: "France", option2: "Germany", option3: "Japan", option4: "Great Britian", answer: 4)
