//
//  ViewController.swift
//  BullsEye
//
//  Created by Erin Woo on 6/29/17.
//  Copyright © 2017 Erin Woo. All rights reserved.
//

import UIKit



class ViewController: UIViewController {

    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!
    
    var targetValue: Int = 0
    var currentValue: Int = 50
    var score = 0
    var round = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.startNewRound()
        startNewGame()
        updateLabels()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func showAlert() {
    
        let difference = abs(targetValue - currentValue)
        let points = 100 - difference
        
        score += points
        
        let message = "You scored \(points) points" + "The value of the slider is: \(currentValue)" +
            "\nThe target value is: \(targetValue)" +
            "\nThe difference is: \(difference)"
        
        let alert = UIAlertController(title: "Hello, World",
                                      message: message,
                                      preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default,
                                   handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        
        startNewRound()
        updateLabels()
    }

    //lroundf to round decimal to nearest whole number
    @IBAction func sliderMoved(_slider: UISlider) {
        currentValue = lroundf(_slider.value)
     }
    
    
    func startNewRound() {
        round += 1
        targetValue = 1 + Int(arc4random_uniform(100))
        currentValue = 50
        slider.value = Float(currentValue)
    }
    
    func updateLabels() {
        targetLabel.text = String(targetValue)
        scoreLabel.text = String(score)
    }
    
    func startNewGame() {
        score = 0
        round = 0
        startNewRound()
    }
    
    @IBAction func startOver() {
        startNewGame()
        updateLabels()
    }
}



