//  keyController.swift
//  pageSwiftTwo
//
//  Created by Aidan Brock on 17/05/2019.
//  Copyright © 2019 Aidan Brock. All rights reserved.

import UIKit
import AVFoundation

class keyController: UIViewController, AVAudioPlayerDelegate {
    
    var audioPlayer:AVAudioPlayer!
    var playing = false //Boolean used to keep track of whether the chord sequence is currently playing or not.

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
        
        if(!playing){ //Starts the loop by setting the playing boolean to true, playing the sound and setting its number of loops to -1, which loops it until the stop() method is called.
            playing = true
            audioPlayer.play()
            audioPlayer.numberOfLoops = -1
        }
        else { //Stops the looping.
            playing = false
            audioPlayer.stop()
        }
    }
    
    @IBAction func c4(_ sender: UIButton) {
        let soundURL = Bundle.main.url(forResource: "c4", withExtension: "mp3")
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: soundURL!)
        }
        catch {
            print(error)
        }
        audioPlayer.stop()
        audioPlayer.play()
    }
    
    @IBAction func cs4(_ sender: UIButton) {
    }
    
    @IBAction func d4(_ sender: UIButton) {
        let soundURL = Bundle.main.url(forResource: "d4", withExtension: "mp3")
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: soundURL!)
        }
        catch {
            print(error)
        }
        audioPlayer.stop()
        audioPlayer.play()
    }
    
    @IBAction func ds4(_ sender: UIButton) {
    }
    
    @IBAction func e4(_ sender: UIButton) {
        let soundURL = Bundle.main.url(forResource: "e4", withExtension: "mp3")
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: soundURL!)
        }
        catch {
            print(error)
        }
        audioPlayer.stop()
        audioPlayer.play()
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
