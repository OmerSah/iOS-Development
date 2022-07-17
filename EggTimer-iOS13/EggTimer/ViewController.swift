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
    
    @IBOutlet var timerLabel: UILabel!
    @IBOutlet var progressBar: UIProgressView!
    var player: AVAudioPlayer?
    
    let softTime = 5
    let mediumTime = 7
    let hardTime = 12
    var seconds = 0
    var totalProgressTime = 1
    var timer: Timer?
    
    let eggTimes = ["Soft": 5, "Medium": 7, "Hard": 12]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        progressBar.progress = 0.0
    }
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        timer?.invalidate()
        progressBar.progress = 0.0
        seconds = 0
        
        let hardness = sender.currentTitle ?? "Any"
        totalProgressTime = eggTimes[hardness] ?? 1
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(update), userInfo: nil, repeats: true)
    }
    
    @objc func update() {
        if seconds <= totalProgressTime {
            seconds += 1
            progressBar.setProgress(
                (Float(seconds) / Float(totalProgressTime)),
                animated: true
            )
        } else {
            timer?.invalidate()
            timerLabel.text = "Done"
            
            let pathURL = Bundle.main.path(forResource: "alarm_sound", ofType: "mp3")
            do {
                guard let path = pathURL else {
                    return
                }
                
                player = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
                
                player?.play()
            } catch {
                print(error.localizedDescription)
            }
            
        }
    }

}

