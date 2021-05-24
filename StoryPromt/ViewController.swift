//
//  ViewController.swift
//  StoryPromt
//
//  Created by Nick Krasnitskiy on 21.05.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nounTextField: UITextField!
    @IBOutlet weak var adjectiveTextField: UITextField!
    @IBOutlet weak var verbTextField: UITextField!
    @IBOutlet weak var numberSlider: UISlider!
    @IBOutlet weak var numberLabel: UILabel!
    
    let storyPromt = StoryPromptEntry()
    
    @IBAction func changeNumber(_ sender: UISlider) {
        numberLabel.text = "Number: \(Int(sender.value))"
        storyPromt.number = Int(sender.value)
    }
    
    @IBAction func changeStoryType(_ sender: UISegmentedControl) {
        if let genre = StoryPrompts.Genre(rawValue: sender.selectedSegmentIndex) {
            storyPromt.genre = genre
        } else {
            storyPromt.genre = .scifi
        }
    }
    
    @IBAction func generateStoryPromt(_ sender: UIButton) {
        updateStoryPromt()
        print(storyPromt)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        numberSlider.value = 7.5
        
        storyPromt.noun = "toaster"
        storyPromt.adjective = "smelly"
        storyPromt.verb = "burps"
        storyPromt.number = Int(numberSlider.value)
    }
    
    func updateStoryPromt() {
        storyPromt.noun = nounTextField.text ?? ""
        storyPromt.adjective = adjectiveTextField.text ?? ""
        storyPromt.verb = verbTextField.text ?? ""
    }
}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        updateStoryPromt()
        return true
    }
}
