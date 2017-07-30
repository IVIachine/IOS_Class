//
//  ViewController.swift
//  FlashGit
//
//  Created by Tyler Chermely on 7/29/17.
//  Copyright © 2017 Sami Vashaw. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    @IBOutlet weak var questionTextView: UITextView!
    @IBOutlet weak var answerPickerView: UIPickerView!
    @IBOutlet weak var questionLabel: UILabel!
    @IBAction func submitButtonPresses(_ sender: Any)
    {
        var alert : UIAlertController
        
        if CardCollection.instance.checkAnswer(answerPickerView.selectedRow(inComponent: 0))
        {
            alert = UIAlertController(title : "Correct", message : "Correct Answer!", preferredStyle: UIAlertControllerStyle.alert)
            
            alert.addAction(UIAlertAction(title: "Yay!", style : UIAlertActionStyle.default, handler : nil))
            self.present(alert, animated:true)
        }
        else
        {
            alert = UIAlertController(title : "Wrong", message : "Wrong Answer!", preferredStyle: UIAlertControllerStyle.alert)
            
            alert.addAction(UIAlertAction(title: "Boo!", style : UIAlertActionStyle.default, handler : nil))
            self.present(alert, animated:true)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCardUI()
        
        answerPickerView.delegate = self
        answerPickerView.dataSource = self
        // Do any additional setup after loading the view, typically from a nib.
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func setupCardUI()
    {
        questionTextView.text = CardCollection.instance.currentCard.question
        questionLabel.text = "Question \(CardCollection.instance.currentIndex + 1)/\(CardCollection.instance.cards.count)"
    }
    
    public func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return CardCollection.instance.currentCard.options.count
    }
    
    public func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return CardCollection.instance.currentCard.options[row]
    }
}

