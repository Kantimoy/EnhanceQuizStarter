//
//  ViewController.swift
//  EnhanceQuizStarter
//
//  Created by Pasan Premaratne on 3/12/18.
//  Copyright © 2018 Treehouse. All rights reserved.
//

import UIKit
import GameKit
import AudioToolbox

class ViewController: UIViewController {
    
    // MARK: - Properties
    
    var questionsPerRound = 0
    var questionsAsked = 0
    var correctQuestions = 0
    
    var gameSound: SystemSoundID = 0
    
    var question = GetQuestion()
    
    // MARK: - Outlets
    @IBOutlet weak var questionField: UILabel!
    @IBOutlet weak var feedBack: UILabel!
    @IBOutlet weak var optionOne: UIButton!
    @IBOutlet weak var optionTwo: UIButton!
    @IBOutlet weak var optionThree: UIButton!
    @IBOutlet weak var optionFour: UIButton!
    
    @IBOutlet weak var playAgainButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadGameStartSound()
        // Start game
        playGameStartSound()
        
        //Shuffle the question array for randomness and then show so that no questions are repeated and with every new play random questions are shown.
        question.shuffleQuestion()
        
        //Total Questions count.
        questionsPerRound = question.questionToDisplay.count
        
        //Display the question after shuffling.
        displayQuestion()
    }
    
    // MARK: - Helpers
    
    func loadGameStartSound() {
        let path = Bundle.main.path(forResource: "GameSound", ofType: "wav")
        let soundUrl = URL(fileURLWithPath: path!)
        AudioServicesCreateSystemSoundID(soundUrl as CFURL, &gameSound)
    }
    
    func playGameStartSound() {
        AudioServicesPlaySystemSound(gameSound)
    }
    
    func displayQuestion() {
        //Assigning questions to question field Label.
        questionField.text = question.showQuestion()
        
        //Hidden buttons.
        feedBack.isHidden = true
        playAgainButton.isHidden = true
        
        //Number of options available in a question.
        var countOfoptions = question.showOption().count
        
        //Show 3 or 4 options based on availability.
        // IF 3 options are available then 4th options is hidden.
        // Then assign answers to button until count is 0.
        if countOfoptions == 3 {
            optionFour.isHidden = true
            
            //Then Loops through array of 'options' and assigns to each button.
            for option in question.showOption() {
                if countOfoptions == 3 {
                    optionOne.setTitle(option, for: .normal)
                } else if countOfoptions == 2 {
                    optionTwo.setTitle(option, for: .normal)
                } else { optionThree.setTitle(option, for: .normal) }
                
                countOfoptions -= 1
            }
        }
            //If 4 options are there then options are set in their respective button.
        else {
            optionFour.isHidden = false //4th option is available.
            for option in question.showOption() {
                if countOfoptions == 4 {
                    optionOne.setTitle(option, for: .normal)
                } else if countOfoptions == 3 {
                    optionTwo.setTitle(option, for: .normal)
                } else if countOfoptions == 2 {
                    optionThree.setTitle(option, for: .normal)
                } else {
                    optionFour.setTitle(option, for: .normal)
                }
                
                countOfoptions -= 1
            }
        }
        
        //Rounding of buttons.
        optionOne.layer.cornerRadius = 5
        optionTwo.layer.cornerRadius = 5
        optionThree.layer.cornerRadius = 5
        optionFour.layer.cornerRadius = 5
    }
    
    func displayScore() {
        // Hide the answer buttons
        optionOne.isHidden = true
        optionTwo.isHidden = true
        optionThree.isHidden = true
        optionFour.isHidden = true
        feedBack.isHidden = true
        
        // Display "play again" & "feedback button"
        playAgainButton.isHidden = false
        
        //questionIndex is 0 as counting of questions will start again.
        question.questionIndex = 0
        
        //Display Final Score
        questionField.text = "Way to go!\nYou got \(correctQuestions) correct out of \(questionsPerRound) questions. !"
    }
    
    func nextRound() {
        if questionsAsked == questionsPerRound {
            // Game is over
            displayScore()
        } else {
            // Continue game
            displayQuestion()
        }
    }
    
    func loadNextRound(delay seconds: Int) {
        // Converts a delay in seconds to nanoseconds as signed 64 bit integer
        let delay = Int64(NSEC_PER_SEC * UInt64(seconds))
        // Calculates a time value to execute the method given current time and delay
        let dispatchTime = DispatchTime.now() + Double(delay) / Double(NSEC_PER_SEC)
        
        // Executes the nextRound method at the dispatch time on the main queue
        DispatchQueue.main.asyncAfter(deadline: dispatchTime) {
            self.nextRound()
        }
    }
    
    // MARK: - Actions
    
    @IBAction func checkAnswer(_ sender: UIButton) {
        // Increment the questions asked counter
        questionsAsked += 1
        
        feedBack.isHidden = false
        if (sender.title(for: .selected)! == question.showCorrectAnswer()) {
            correctQuestions += 1
            feedBack.text = "Correct!"
        } else {
            feedBack.text = "Sorry, wrong answer!"
        }
        
        //Increase the index to go to next question.
        question.questionIndex += 1
        loadNextRound(delay: 2)
    }
    
    
    @IBAction func playAgain(_ sender: UIButton) {
        
        // Show the answer buttons
        questionField.isHidden = false
        optionOne.isHidden = false
        optionTwo.isHidden = false
        optionThree.isHidden = false
        optionFour.isHidden = false
        playAgainButton.layer.cornerRadius = 8
        
        questionsAsked = 0
        correctQuestions = 0
        
        //Questions are shuffled so that questions are displaed randomly.
        question.shuffleQuestion()
        nextRound()
    }
    

}

