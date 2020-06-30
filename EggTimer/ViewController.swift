//
//  ViewController.swift
//  EggTimer
//
//  Created by Kushal Bhanot on 29/06/2020.
//  Copyright © 2020 Kushal Bhanot. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    let eggTimes = ["Soft": 3, "Medium": 4, "Hard": 7]
    var timer = Timer()
    var totalTime = 0
    var secondsPassed = 0
    
    var AudioPlayer: AVAudioPlayer!
    
    @IBOutlet weak var textLABEL: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        timer.invalidate()
        let hardness = sender.currentTitle!
        totalTime = eggTimes[hardness]!
        progressBar.progress = 0.0
        secondsPassed = 0
        textLABEL.text = hardness
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
    }

    
        @objc func updateCounter() {

            if secondsPassed < totalTime {
                secondsPassed += 1
                progressBar.progress = Float(secondsPassed) / Float(totalTime)
                
            }
            else {
                timer.invalidate()
                let AudioURL = NSURL(fileURLWithPath: Bundle.main.path(forResource: "alarm_sound", ofType: "mp3")!)

                do {
                    AudioPlayer = try AVAudioPlayer(contentsOf: AudioURL as URL)
                } catch _ as NSError {
                    fatalError()
                }

                AudioPlayer.play()
                textLABEL.text = "Done :)"
            }
        }
        
//        if hardness == "Soft" {
//            print(softTime)
//        }
//        else if hardness == "Medium" {
//            print(mediumTime)
//        }
//        else {
//            print(hardTime)
//        }
        
//        switch hardness {
//        case "Soft":
//            print(softTime)
//        case "Medium":
//            print(mediumTime)
//        case "Hard":
//            print(hardTime)
//        default:
//            print("Error")
//        }
}
