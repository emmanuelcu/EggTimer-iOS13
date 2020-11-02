//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var timerProgressBar: UIProgressView!
    
    let eggTimes = ["Soft": 300, "Medium": 420, "Hard": 720]
    var totalTime = 0
    var secondsPassed = 0
    var player: AVAudioPlayer!
    var timer = Timer()
    
   
    @IBAction func eggPressed(_ sender: UIButton) {
        
        timer.invalidate()
        let hardness = sender.currentTitle!
        totalTime = eggTimes[hardness]!
        
        timerProgressBar.progress = 0.0
        secondsPassed = 0
        timerLabel.text = hardness
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self,
                             selector: #selector(updateTimer), userInfo: nil, repeats: true)
        
    }
    

    
    @objc func updateTimer(){
        if secondsPassed < totalTime {
            secondsPassed += 1
            timerProgressBar.progress = Float(secondsPassed)/Float(totalTime)
            print(secondsPassed, totalTime)
            timerLabel.text = "\(secondsPassed) seconds"
        }else{
            timer.invalidate()
            timerLabel.text = "DONE!"
            
            let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
            player = try! AVAudioPlayer(contentsOf: url!)
            player.play()
        }
    }
    
    
    


}
