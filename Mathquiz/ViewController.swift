//
//  ViewController.swift
//  Mathquiz
//
//  Created by Christina Wolff and Joe Davidson on 2/18/19.
//  Copyright © 2019 Christina Wolff. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var NumberOneLabel: UILabel!
    @IBOutlet var NumberTwoLabel: UILabel!
    @IBOutlet var operatorsLabel: UILabel!
    @IBOutlet var pointsLabel: UILabel!
    @IBOutlet var answerField: UITextField!
    
    var totalAnswers:Int = 0
    var points:Int = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NumberOneLabel.text = number1[currentQuestionIndex]
        NumberTwoLabel.text = number2[currentQuestionIndex]
        operatorsLabel.text = operators[currentQuestionIndex]
        
    }
    
    
    let operators: [String] =    ["+","-","*","/","+","-","*","-","+","-"]
    let number1: [String] =      ["0","1","2","3","4","5","6","7","8","9"]
    let number2: [String] =      ["2","7","5","3","8","0","1","4","6","9"]
    let answers: [String] =      ["2","-6","10","1","12","5","6","3","14","0"]
    var currentQuestionIndex: Int = 0
    
    @IBAction func submitQuestion(_ sender: UIButton) {
        let answerAttempt = answerField.text
        totalAnswers+=1
        if answerAttempt == answers[currentQuestionIndex]{
            points+=1
        }
        
            currentQuestionIndex += 1
            if currentQuestionIndex == number1.count {
                currentQuestionIndex = 0
            }
            
            NumberOneLabel.text = number1[currentQuestionIndex]
            NumberTwoLabel.text = number2[currentQuestionIndex]
            operatorsLabel.text = operators[currentQuestionIndex]
            pointsLabel.text = "\(points) / \(totalAnswers)"
            
        
        answerField.text = nil
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH"
        let userHours = dateFormatter.string(from: date)
        
        let color: UIColor
        if Int(userHours)! > 6 && Int(userHours)! < 18 {
            color = UIColor(red: 0.8, green: 0.8, blue: 0.8, alpha: 1)
        } else {
            color = UIColor(red: 0.25, green: 0.25, blue: 0.25, alpha: 1)
        }
        self.view.backgroundColor = color
        print(userHours)
    }
}
