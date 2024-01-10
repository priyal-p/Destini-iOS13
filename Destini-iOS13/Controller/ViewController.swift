//
//  ViewController.swift
//  Destini-iOS13
//
//  Created by Angela Yu on 08/08/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var storyLabel: UILabel!
    @IBOutlet weak var choice1Button: UIButton!
    @IBOutlet weak var choice2Button: UIButton!
    
    let example = Story(title: "You see a fork in the road.",
                        choice1: "Take a left.",
                        choice2: "Take a right.")
    let stories = [
        Story(title: "You see a fork in the road.",
              choice1: "Take a left.",
              choice2: "Take a right."),
        Story(title: "You see a tiger.",
              choice1: "Shout for help.",
              choice2: "Play dead."),
        Story(title: "You find a treasure chest.",
              choice1: "Open it.",
              choice2: "Check for traps."),
    ]

    var currentQuestion = 0
    var nextQuestion = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }

    @IBAction func choiceMade(_ sender: UIButton) {
        let currentSelection = sender.currentTitle!
        if currentSelection == stories[currentQuestion].choice1 {
            if nextQuestion != 0 {
                currentQuestion = nextQuestion
                nextQuestion = currentQuestion + 2
            } else {
                nextQuestion = currentQuestion + 2
                currentQuestion = currentQuestion + 1
            }
        } else {
            if nextQuestion != 0 {
                currentQuestion = nextQuestion
                nextQuestion = currentQuestion + 2
            } else {
                nextQuestion = currentQuestion + 1
                currentQuestion = currentQuestion + 2
            }
        }
        updateUI()
    }
    
    func updateUI() {
        if currentQuestion < stories.count - 1 {
            storyLabel.text = stories[currentQuestion].title
            choice1Button.setTitle(stories[currentQuestion].choice1, for: .normal)
            choice2Button.setTitle(stories[currentQuestion].choice2, for: .normal)
        }
    }
}

