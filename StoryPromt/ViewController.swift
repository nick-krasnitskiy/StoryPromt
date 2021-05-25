//
//  ViewController.swift
//  StoryPromt
//
//  Created by Nick Krasnitskiy on 21.05.2021.
//

import UIKit
import PhotosUI

class ViewController: UIViewController {
    
    @IBOutlet weak var nounTextField: UITextField!
    @IBOutlet weak var adjectiveTextField: UITextField!
    @IBOutlet weak var verbTextField: UITextField!
    @IBOutlet weak var numberSlider: UISlider!
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var storyPromtImageView: UIImageView!
    
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
        if storyPromt.isValid() {
            print(storyPromt)
        } else {
            let alert = UIAlertController(title: "Invalid Story Promt", message: "Please fill out all of the fields", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default) { (action) in }
            alert.addAction(action)
            present(alert, animated: true)
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        numberSlider.value = 7.5
        
        storyPromt.noun = "toaster"
        storyPromt.adjective = "smelly"
        storyPromt.verb = "burps"
        storyPromt.number = Int(numberSlider.value)
        storyPromtImageView.isUserInteractionEnabled = true
        
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(changeImage))
        storyPromtImageView.addGestureRecognizer(gestureRecognizer)
    }
    
    func updateStoryPromt() {
        storyPromt.noun = nounTextField.text ?? ""
        storyPromt.adjective = adjectiveTextField.text ?? ""
        storyPromt.verb = verbTextField.text ?? ""
    }
    
    @objc func changeImage() {
        var configuration = PHPickerConfiguration()
        configuration.filter = .images
        configuration.selectionLimit = 1
        
        let controller = PHPickerViewController(configuration: configuration)
        controller.delegate = self
        present(controller, animated: true)
    }
}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        updateStoryPromt()
        return true
    }
}

extension ViewController: PHPickerViewControllerDelegate {
  func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
    if !results.isEmpty {
      let result = results.first!
      let itemProvider = result.itemProvider
      if itemProvider.canLoadObject(ofClass: UIImage.self) {
        itemProvider.loadObject(ofClass: UIImage.self) { [weak self] image, error in
          guard let image = image as? UIImage else {
            return
          }
          DispatchQueue.main.async {
            self?.storyPromtImageView.image = image
          }
        }
      }
    }
  }
}

