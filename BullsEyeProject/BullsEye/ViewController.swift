//
//  ViewController.swift
//  BullsEye
//
//  Created by Barthelemy, Terry on 2/11/21.
//

import UIKit

class ViewController: UIViewController {
  
    var currentValue = 0
    var targetValue = 0
    @IBOutlet weak var slider : UISlider!
    @IBOutlet weak var targetLabel : UILabel!
    @IBOutlet weak var scoreLabel : UILabel!
    @IBOutlet weak var roundLabel: UILabel!
    
    
    var score = 0
    var round = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        currentValue = lrintf(slider.value)
        startNewGame()
        
        let thumbImageNormal = UIImage(named: "SliderThumb-Normal")
        slider.setThumbImage(thumbImageNormal, for: .normal)
        
        let thumbImageHighlighted = UIImage(named: "SliderThumb-Highlighted")
        slider.setThumbImage(thumbImageHighlighted, for: .highlighted)
        
        let insets = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
        
        let trackLeftImage = UIImage(named: "SliderTrackLeft")
        let trackLeftResizable = trackLeftImage?.resizableImage(withCapInsets: insets)
        slider.setMinimumTrackImage(trackLeftResizable, for: .normal)
      
        
        let trackRightImage = UIImage(named: "SliderTrackRight")
        let trackRightResizable = trackRightImage?.resizableImage(withCapInsets: insets)
        slider.setMaximumTrackImage(trackRightResizable, for: .normal)
        
        
        
    }
    func updateLabels(){
        targetLabel.text = String(targetValue)
        scoreLabel.text = String(score)
        roundLabel.text = String(round)
    }
    
    func startNewRound(){
        targetValue = 1 + Int(arc4random_uniform(100))
        currentValue = 50
        slider.value = Float(currentValue)
        updateLabels()
       
    }

    @IBAction func sliderMoved(_ slider: UISlider) {
        print("The vale of slider now is \(slider.value)")
        currentValue = lrintf(slider.value)
    }
    
    @IBAction func showAlert(_ sender: Any) {
        
        let difference = abs(targetValue - currentValue)
        var points = 100 - difference
        
         
       
        round += 1
        let title : String
        if difference == 0 {
            title = "Perfect"
            points += 100
        } else if difference < 5{
            title = "You almost had it"
            if difference == 1{
                points += 50
            }
        } else if difference > 10 {
            title = "Pretty good!"
        } else {
            title = "Not even close.."
        }
        
        score += points
        let message = "You scored \(points) points"
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Awesome", style: .default, handler: {
            action in
            self.startNewRound()
        })
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
        
 
    }
    

    @IBAction func startNewGame(){
        score = 0
        round = 0
        startNewRound()
    }
    
}

