//
//  ViewController.swift
//  BullsEye
//
//  Created by Steve Anavi on 8/31/15.
//  Copyright (c) 2015 Steve Anavi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var currentValue = 0
    var targetValue = 0
    var scoreValue = 0
    var points = 0
    var round = 0
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.startNewRound()
        self.updateLabels()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func startNewRound() {
        targetValue = 1 + Int(arc4random_uniform(100))
        currentValue = 50
        slider.value = Float(currentValue)
    }
    
    func updateLabels() {
        targetLabel.text = String(targetValue)
        scoreLabel.text = String(scoreValue)
        roundLabel.text = String(round)
    }
    
    func calcuateScore() {
        let difference = abs(targetValue - currentValue)
        points = 100 - difference
        scoreValue += points
        round += 1
    }

    @IBAction func showAlert() {
        calcuateScore()
        let message = "The value of the slider is: \(currentValue)" + "\nThe target value is: \(targetValue)" + "\nYou scored \(points) points"
        let alert = UIAlertController(title: title,
            message: message, preferredStyle: .Alert)
        let action = UIAlertAction(title: "OK", style: .Default, handler: nil)
        alert.addAction(action)
        presentViewController(alert, animated: true, completion: nil)
        startNewRound()
        updateLabels()
    }
    
    @IBAction func sliderMoved(slider: UISlider) {
        println("The value of the slider is now: \(slider.value)")
        currentValue = lroundf(slider.value)
    }
}

