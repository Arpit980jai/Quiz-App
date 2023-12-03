//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var barProgress: UIProgressView!
    @IBOutlet weak var choice1: UIButton!
    @IBOutlet weak var choice2: UIButton!
    @IBOutlet weak var choice3: UIButton!
    @IBOutlet weak var questionLabel: UILabel!
    
    var quizBrain = QuizBrain()
    
    
    @objc func updateUI(){
        questionLabel.text=quizBrain.getQuestionText()
        scoreLabel.text="Score : \(quizBrain.getScore())"
        let answerChoices = quizBrain.getOptions()
        choice1.setTitle(answerChoices[0], for: .normal)
        choice2.setTitle(answerChoices[1], for: .normal)
        choice3.setTitle(answerChoices[2], for: .normal)
        choice1.backgroundColor=UIColor.clear
        choice2.backgroundColor=UIColor.clear
        choice3.backgroundColor=UIColor.clear
        let progress=quizBrain.getProgress()
        barProgress.progress=progress
    }
    
    override func viewDidLoad() 
    {
        
        super.viewDidLoad()
        
        updateUI()
        
            
    }
    @IBAction func answerPressed(_ sender: UIButton) {
        
        let userAnswer=sender.currentTitle!
        let isUserGotRight = quizBrain.checkAnswer(userAnswer: userAnswer)
        
        
        if isUserGotRight
        {
            sender.backgroundColor=UIColor.green
            
        }
        else{
            sender.backgroundColor=UIColor.red
        }
            
        
        quizBrain.nextQuestion()
        Timer.scheduledTimer(timeInterval: 0.4, target: self, selector:
                                #selector(updateUI), userInfo: nil, repeats: false)
    }
    
}

