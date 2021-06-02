//
//  StoryPromtViewController.swift
//  StoryPromt
//
//  Created by Nick Krasnitskiy on 01.06.2021.
//

import UIKit

class StoryPromtViewController: UIViewController {

    @IBOutlet weak var storyPromtTextView: UITextView!
    
    var storyPrompt: StoryPromptEntry?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        storyPromtTextView.text = storyPrompt?.description
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }

}
