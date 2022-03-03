//
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 28/06/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    var player: AVAudioPlayer!
    
    @IBAction func keyPressed(_ sender: UIButton) {
        // Or we can use sender.titleLabel!.text!
        print(sender.currentTitle!)
        playSound(buttonTitle: sender.currentTitle!);
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    func playSound(buttonTitle name: String) {
            let url = Bundle.main.url(forResource: name, withExtension: "wav")
            player = try! AVAudioPlayer(contentsOf: url!)
            player.play()
                    
    }

}

