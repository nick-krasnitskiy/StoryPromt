//
//  StoryPromtViewController.swift
//  StoryPromt
//
//  Created by Nick Krasnitskiy on 01.06.2021.
//

import UIKit

class StoryPromtViewController: UIViewController {

    @IBOutlet weak var storyPromtTextView: UITextView!
    
    var storyPrompt = StoryPromptEntry()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        storyPrompt.noun = "toaster"
        storyPrompt.verb = "swims"
        storyPrompt.adjective = "smelly"
        storyPrompt.number = 7
        
        storyPromtTextView.text = storyPrompt.description
    }

}
