//
//  QuestionProvider.swift
//  EnhanceQuizStarter
//
//  Created by Kantimoy Sur on 2019-06-23.
//  Copyright © 2019 Treehouse. All rights reserved.
//

import Foundation


class GetQuestion {
    
    //Array of all the questions from question class.
    var allQuestion = [question1,question2,question3,question4,question5,question6,question7,question8,question9,question10]
    
    //Questions in this array will be shown in the app.
    var questionToDisplay = [Question]()
    
    //For saving the index of the question.
    var questionIndex = 0
    
    //Shuffles the allQuestion array.
    func shuffleQuestion() {
        questionToDisplay = allQuestion.shuffled()
    }
    
    //Displays questions by calling displayQuestion method from QuestionClass.
    func showQuestion() -> String {
        return questionToDisplay[questionIndex].displayQustion()
    }
    
    //Displays options by calling displayOptions method from QuestionClass.
    func showOption() -> [String] {
        return questionToDisplay[questionIndex].displayOptions()
    }
    
    //Displays correct answer by calling displayAnswer method from QuestionClass.
    func showCorrectAnswer() -> String {
        return questionToDisplay[questionIndex].displayAnswer()
    }
    
    
}

