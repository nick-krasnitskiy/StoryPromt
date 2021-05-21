//
//  ViewController.swift
//  StoryPromt
//
//  Created by Nick Krasnitskiy on 21.05.2021.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let storyPromt = StoryPromptEntry()
        storyPromt.noun = "toaster"
        storyPromt.adjective = "smelly"
        storyPromt.verb = "burps"
        storyPromt.number = 10
        print(storyPromt)
    }


}

