//
//  QuestionsClass.swift
//  EnhanceQuizStarter
//
//  Created by Kantimoy Sur on 2019-06-23.
//  Copyright © 2019 Treehouse. All rights reserved.
//

import Foundation

class Question {
    
    var question: String
    var options: [String]
    var answer: String
    
    init(question: String, options: [String], answer: String) {
        self.question = question
        self.options = options
        self.answer = answer
    }
    
    //Ouputs Questions.
    func displayQustion() -> String { return question }
    
    //Outputs Answers in array.
    func displayOptions() -> [String] {
        var outputOptions = [String]()
        for option in options {
            outputOptions.append(option)
        }
        return outputOptions }
    
    //Outputs Correct Answer.
    func displayAnswer() -> String { return answer }
}


//Questions for the quiz.

var question1 = Question(question: "This was the only US President to serve more than two consecutive terms.", options: ["George Washington","Franklin D. Roosevelt","Woodrow Wilson","Andrew Jackson"], answer: "Franklin D. Roosevelt")

var question2 = Question(question: "Which of the following countries has the most residents?", options: ["Nigeria","Russia","Iran","Vietnam"], answer: "Nigeria")


var question3 = Question(question: "In what year was the United Nations founded?", options: ["1918","1919","1945","1954"], answer: "1945")


var question4 = Question(question: "The Titanic departed from the United Kingdom, where was it supposed to arrive?", options: ["Paris","Washington D.C.","New York City","Boston"], answer: "New York City")


var question5 = Question(question: "Which nation produces the most oil?", options: ["Iran","Iraq","Brazil","Canada"], answer: "Canada")


var question6 = Question(question: "Which country has most recently won consecutive World Cups in Soccer?", options: ["Italy","Brazil","Argetina","Spain"], answer: "Brazil")


var question7 = Question(question: "Which of the following rivers is longest?", options: ["Yangtze","Mississippi","Mekong","Mekong"], answer: "Mississippi")


var question8 = Question(question: "Which city is the oldest?", options: ["Mexico City","Cape Town","San Juan","Sydney"], answer: "Mexico City")


var question9 = Question(question: "Which country was the first to allow women to vote in national elections?", options: ["Poland","United States","Senegal","1954"], answer: "Poland")

var question10 = Question(question: "Which of these countries won the most medals in the 2012 Summer Games?", options: ["France","Germany","Japan","Great Britian"], answer: "Great Britian")

var question11 = Question(question: "This is text for 3 options", options: ["One","Two","Three"], answer: "Three")

var question12 = Question(question: "Check for 3 answers?", options: ["1","2","3"], answer: "2")

