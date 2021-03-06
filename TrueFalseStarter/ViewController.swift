//
//  ViewController.swift
//  TrueFalseStarter
//
//  Created by Pasan Premaratne on 3/9/16.
//  Copyright © 2016 Treehouse. All rights reserved.
//

import UIKit
import GameKit
import AudioToolbox

class ViewController: UIViewController {
   
    
    let questionsPerRound = 4
    var questionsAsked = 0
    var correctQuestions = 0
    var indexOfSelectedQuestion: Int = 0
    
    var gameSound: SystemSoundID = 0
    
    var trivia = triviaAll
    
    let tintWrong = UIColor(red: 255, green: 255, blue: 255, alpha: 0.35)
    let tintRight = UIColor(red: 255, green: 255, blue: 255, alpha: 1.0)

    
    @IBOutlet weak var questionField: UILabel!
    @IBOutlet weak var playAgainButton: UIButton!
    
    // Answer Buttons
    @IBOutlet weak var answer1: UIButton!
    @IBOutlet weak var answer2: UIButton!
    @IBOutlet weak var answer3: UIButton!
    @IBOutlet weak var answer4: UIButton!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        loadGameStartSound()
        // Start game
        playGameStartSound()
        displayQuestion()
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    
    func displayQuestion() {
        indexOfSelectedQuestion = GKRandomSource.sharedRandom().nextInt(upperBound: trivia.count)
        let questionDictionary = trivia[indexOfSelectedQuestion]
        questionField.text = questionDictionary.question
        playAgainButton.isHidden = true
        

        if questionDictionary.option4 == nil {
            answer4.isEnabled = false
        } else {
            answer4.isEnabled = true
        }
        
        // change text on answerbuttons to match answer options in the current question
        answer1.setTitle(questionDictionary.option1, for: .normal)
        answer2.setTitle(questionDictionary.option2, for: .normal)
        answer3.setTitle(questionDictionary.option3, for: .normal)
        answer4.setTitle(questionDictionary.option4, for: .normal)
        
        // Change button text.tintColor to normal
        answer1.tintColor = tintRight
        answer2.tintColor = tintRight
        answer3.tintColor = tintRight
        answer4.tintColor = tintRight
    }
    
    
    
    func displayScore() {
        // Hide the answer buttons
        answer1.isHidden = true
        answer2.isHidden = true
        answer3.isHidden = true
        answer4.isHidden = true
        
        // Display play again button
        playAgainButton.isHidden = false
        
        questionField.text = "Way to go!\nYou got \(correctQuestions) out of \(questionsPerRound) correct!"
        
    }
    
    @IBAction func checkAnswer(_ sender: UIButton) {
        // Increment the questions asked counter
        questionsAsked += 1
        
        let selectedQuestionDict = trivia[indexOfSelectedQuestion]
        let correctAnswer = selectedQuestionDict.answer
        
        
        if (sender === answer1 && correctAnswer == 1) || (sender === answer2 && correctAnswer == 2) {
            correctQuestions += 1
            questionField.text = "Correct!"
        } else if (sender === answer3 && correctAnswer == 3) || (sender === answer4 && correctAnswer == 4) {
            correctQuestions += 1
            questionField.text = "Correct!"
        } else {
            questionField.text = "Sorry, wrong answer!"
            
        }
        
        switch selectedQuestionDict.answer {
        case 1: answer2.tintColor = tintWrong; answer3.tintColor = tintWrong; answer4.tintColor = tintWrong
        case 2: answer1.tintColor = tintWrong; answer3.tintColor = tintWrong; answer4.tintColor = tintWrong
        case 3: answer1.tintColor = tintWrong; answer2.tintColor = tintWrong; answer4.tintColor = tintWrong
        case 4: answer1.tintColor = tintWrong; answer2.tintColor = tintWrong; answer3.tintColor = tintWrong
        default:
            print("this is not possible")
        }
        
        
        trivia.remove(at: indexOfSelectedQuestion)
        loadNextRoundWithDelay(seconds: 2)
        
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
    
    @IBAction func playAgain() {
        // Show the answer buttons
        answer1.isHidden = false
        answer2.isHidden = false
        answer3.isHidden = false
        answer4.isHidden = false
        
        questionsAsked = 0
        correctQuestions = 0
        nextRound()
        
        trivia = triviaAll
    }
    

    
    // MARK: Helper Methods
    
    func loadNextRoundWithDelay(seconds: Int) {
        // Converts a delay in seconds to nanoseconds as signed 64 bit integer
        let delay = Int64(NSEC_PER_SEC * UInt64(seconds))
        // Calculates a time value to execute the method given current time and delay
        let dispatchTime = DispatchTime.now() + Double(delay) / Double(NSEC_PER_SEC)
        
        // Executes the nextRound method at the dispatch time on the main queue
        DispatchQueue.main.asyncAfter(deadline: dispatchTime) {
            self.nextRound()
        }
    }
    
    func loadGameStartSound() {
        let pathToSoundFile = Bundle.main.path(forResource: "GameSound", ofType: "wav")
        let soundURL = URL(fileURLWithPath: pathToSoundFile!)
        AudioServicesCreateSystemSoundID(soundURL as CFURL, &gameSound)
    }
    
    func playGameStartSound() {
        AudioServicesPlaySystemSound(gameSound)
    }
    }

