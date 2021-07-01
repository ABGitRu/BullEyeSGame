//
//  ViewController.swift
//  BullEyeSGame
//
//  Created by Mac on 28.06.2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var slider: UISlider!
    @IBOutlet var targetLabel: UILabel!
    @IBOutlet var scoreLabel: UILabel!
    @IBOutlet var roundLabel: UILabel!
    
    var currentValue = 0
    var targetValue = 0
    var score = 0
    var round = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setSlider()
        startNewGame()
    }
    
    @IBAction func showAlert() {
        let differense = abs(targetValue - currentValue)
        var points = 100 - differense
        let title: String
        
        switch points {
        case 0...10:
           title = "Not cool"
        case 11...30:
            title = "That's not big"
        case 31...60:
            title = "Ow that really not bad"
        case 61...90:
            title = "That was close"
        case 91...99:
            title = "Realy cool result!"
        default:
            title = "Oh my god! It's unbelieveble!"
            points += 100
        }
        
        score += points
        let message =
            "Slider value is : \(currentValue)" +
            "\n Target value is : \(targetValue)" +
            "\n Points for this round is : \(points)"
        let alertController = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )
        
        let okAction = UIAlertAction(
            title: "Ok",
            style: .default) { _ in
            self.startNewRound()
        }
        
        alertController.addAction(okAction)
        present(alertController, animated: true)
    }
    
    @IBAction func startOverTapped() {
        startNewGame()
    }
    
    
    @IBAction func sliderMoved(_ slider: UISlider) {
        currentValue = lroundf(slider.value)
    }
    
    private func setSlider() {

        guard let thumbImageNormal = UIImage(named: "SliderThumb-Normal"),
              let thumbImageHighlighted = UIImage(named: "SliderThumb-Highlighted"),
              let trackLeftImage = UIImage(named: "SliderTrackLeft"),
              let trackRightImage = UIImage(named: "SliderTrackRight")
              else { return }
        
        slider.setThumbImage(thumbImageNormal, for: .normal)
        slider.setThumbImage(thumbImageHighlighted, for: .highlighted)
        
        let insets = UIEdgeInsets(
            top: 0,
            left: 14,
            bottom: 0,
            right: 14
        )
        
        let trackLeftResizeble = trackLeftImage.resizableImage(withCapInsets: insets)
        let trackRightResizeble = trackRightImage.resizableImage(withCapInsets: insets)
        
        slider.setMinimumTrackImage(trackLeftResizeble, for: .normal)
        slider.setMaximumTrackImage(trackRightResizeble, for: .normal)
    }
    
    private func startNewGame() {
        round = 0
        score = 0
        startNewRound()
        let transition = CATransition()
        transition.type = CATransitionType.fade
        transition.duration = 1
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeOut)
        view.layer.add(transition, forKey: nil)
    }
    
    private func startNewRound() {
        round += 1
        targetValue = Int.random(in: 1...100)
        currentValue = 50
        slider.value = Float(currentValue)
        updateLabels()
    }
    
    private func updateLabels() {
        targetLabel.text = String(targetValue)
        scoreLabel.text = String(score)
        roundLabel.text = String(round)
    }
}

