//
//  ViewController.swift
//  Destini
//
//  Created by Philipp Muellauer on 01/09/2015.
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // Our strings
    let stories: [String] = [
        "Your car has blown a tire on a winding road in the middle of nowhere with no cell phone reception. You decide to hitchhike. A rusty pickup truck rumbles to a stop next to you. A man with a wide brimmed hat with soulless eyes opens the passenger door for you and asks: \"Need a ride, boy?\".",
        "He nods slowly, unphased by the question.",
        "As you begin to drive, the stranger starts talking about his relationship with his mother. He gets angrier and angrier by the minute. He asks you to open the glovebox. Inside you find a bloody knife, two severed fingers, and a cassette tape of Elton John. He reaches for the glove box.",
        "What? Such a cop out! Did you know traffic accidents are the second leading cause of accidental death for most adult age groups?",
        "As you smash through the guardrail and careen towards the jagged rocks below you reflect on the dubious wisdom of stabbing someone while they are driving a car you are in.",
        "You bond with the murderer while crooning verses of \"Can you feel the love tonight\". He drops you off at the next town. Before you go he asks you if you know any good places to dump bodies. You reply: \"Try the pier.\""
    ]
    
    let answer1a = "I\'ll hop in. Thanks for the help!"
    let answer1b = "Better ask him if he\'s a murderer first."
    
    let answer2a = "At least he\'s honest. I\'ll climb in."
    let answer2b = "Wait, I know how to change a tire."
    
    let answer3a = "I love Elton John! Hand him the cassette tape."
    let answer3b = "It\'s him or me! You take the knife and stab him."
    
    var currentStory: Int = 1
    
    // UI Elements linked to the storyboard
    @IBOutlet weak var topButton: UIButton!         // Has TAG = 1
    @IBOutlet weak var bottomButton: UIButton!      // Has TAG = 2
    @IBOutlet weak var storyTextView: UILabel!
    
    @IBOutlet weak var restartButton: UIButton!
    // TODO Step 5: Initialise instance variables here
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        restartButton.isHidden = true
        updateStory()
    }

    
    // User presses one of the buttons
    @IBAction func buttonPressed(_ sender: UIButton) {
    
        if sender.tag == 1 {
            // Top Button Pressed
            if currentStory == 1 || currentStory == 2{
                currentStory = 3
            } else if currentStory == 3 {
                currentStory = 6
            }
        } else if sender.tag == 2 {
            // Bottom Button Pressed
            if currentStory == 1 {
                currentStory = 2
            } else if currentStory == 2 {
                currentStory = 4
            } else if currentStory == 3 {
                currentStory = 5
            }
        }
        
        updateStory()
    }
    
    @IBAction func restartPressed(_ sender: Any) {
        currentStory = 1
        restartButton.isHidden = true
        updateStory()
    }
    
    func updateStory(){
        storyTextView.text = stories[currentStory - 1]
        
        if currentStory == 1 || currentStory == 2 || currentStory == 3 {
            topButton.isHidden = false
            bottomButton.isHidden = false
            if currentStory == 1 {
                topButton.setTitle(answer1a, for: .normal)
                bottomButton.setTitle(answer1b, for: .normal)
            } else if currentStory == 2 {
                topButton.setTitle(answer2a, for: .normal)
                bottomButton.setTitle(answer2b, for: .normal)
            } else {
                topButton.setTitle(answer3a, for: .normal)
                bottomButton.setTitle(answer3b, for: .normal)
            }
        } else {
            restartButton.isHidden = false
            topButton.isHidden = true
            bottomButton.isHidden = true
        }
    }



}

