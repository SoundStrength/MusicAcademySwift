//  keyController.swift
//  pageSwiftTwo
//
//  Created by Aidan Brock on 17/05/2019.
//  Copyright © 2019 Aidan Brock. All rights reserved.

import UIKit
import AVFoundation

class keyController: UIViewController, AVAudioPlayerDelegate {
    
    var chordPlayer:AVAudioPlayer!
    var c4player:AVAudioPlayer!
    var d4player:AVAudioPlayer!
    var e4player:AVAudioPlayer!
    
    let chordURL = Bundle.main.url(forResource: "chordSeq1", withExtension: "wav")
    let c4URL = Bundle.main.url(forResource: "c4", withExtension: "mp3")
    let d4URL = Bundle.main.url(forResource: "d4", withExtension: "mp3")
    let e4URL = Bundle.main.url(forResource: "e4", withExtension: "mp3")
    
    var playing = false //Boolean used to keep track of whether the chord sequence is currently playing or not.
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func playPause(_ sender: UIButton) {
        do {
            chordPlayer = try AVAudioPlayer(contentsOf: chordURL!)
        }
        catch {
            print(error)
        }
        
        if(!playing){ //Starts the loop by setting the playing boolean to true, playing the sound and setting its number of loops to -1, which loops it until the stop() method is called.
            playing = true
            chordPlayer.play()
            chordPlayer.numberOfLoops = -1
        }
        else { //Stops the looping.
            playing = false
            chordPlayer.stop()
        }
    }
    
    @IBAction func c4(_ sender: UIButton) {
        do {
            c4player = try AVAudioPlayer(contentsOf: c4URL!)
        }
        catch {
            print(error)
        }
        
        c4player.stop()
        c4player.play()
    }
    
    @IBAction func cs4(_ sender: UIButton) {
    }
    
    @IBAction func d4(_ sender: UIButton) {
        do {
            d4player = try AVAudioPlayer(contentsOf: d4URL!)
        }
        catch {
            print(error)
        }
        
        d4player.stop()
        d4player.play()
    }
    
    @IBAction func ds4(_ sender: UIButton) {
    }
    
    @IBAction func e4(_ sender: UIButton) {
        do {
            e4player = try AVAudioPlayer(contentsOf: e4URL!)
        }
        catch {
            print(error)
        }
        
        e4player.stop()
        e4player.play()
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
