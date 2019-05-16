//  keyController.swift
//  pageSwiftTwo
//
//  Created by Aidan Brock on 17/05/2019.
//  Copyright © 2019 Aidan Brock. All rights reserved.

import UIKit
import AVFoundation

class keyController: UIViewController, AVAudioPlayerDelegate {
    
    var audioPlayer:AVAudioPlayer!
    var playing = false //Boolean used to keep track of whether 

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func playPause(_ sender: UIButton) {
        let soundURL = Bundle.main.url(forResource: "chordSeq1", withExtension: "wav")
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: soundURL!)
        }
        catch {
            print(error)
        }
        
        if(!playing){
            playing = true
            audioPlayer.play()
            audioPlayer.numberOfLoops = -1
        }
        else {
            playing = false
            audioPlayer.stop()
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
