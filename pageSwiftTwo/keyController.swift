//  keyController.swift
//  pageSwiftTwo
//
//  Created by Aidan Brock on 17/05/2019.
//  Copyright © 2019 Aidan Brock. All rights reserved.

import UIKit
import AVFoundation

class keyController: UIViewController, AVAudioPlayerDelegate {
    
    @IBOutlet weak var cs4btn: UIButton!
    @IBOutlet weak var d4btn: UIButton!
    @IBOutlet weak var ds4btn: UIButton!
    @IBOutlet weak var e4btn: UIButton!
    @IBOutlet weak var f4btn: UIButton!
    @IBOutlet weak var fs4btn: UIButton!
    @IBOutlet weak var g4btn: UIButton!
    @IBOutlet weak var gs4btn: UIButton!
    @IBOutlet weak var a4btn: UIButton!
    @IBOutlet weak var as4btn: UIButton!
    @IBOutlet weak var b4btn: UIButton!
    @IBOutlet weak var c5btn: UIButton!
    @IBOutlet weak var cs5btn: UIButton!
    @IBOutlet weak var d5btn: UIButton!
    @IBOutlet weak var keysNum: UILabel!
    
    var availableKeys = 1;
    var keyVolume = 0.25;
    var chordVolume = 1.0;
    
    var chordPlayer:AVAudioPlayer!
    var c4player:AVAudioPlayer!
    var cs4player:AVAudioPlayer!
    var d4player:AVAudioPlayer!
    var ds4player:AVAudioPlayer!
    var e4player:AVAudioPlayer!
    var f4player:AVAudioPlayer!
    var fs4player:AVAudioPlayer!
    var g4player:AVAudioPlayer!
    var gs4player:AVAudioPlayer!
    var a4player:AVAudioPlayer!
    var as4player:AVAudioPlayer!
    var b4player:AVAudioPlayer!
    var c5player:AVAudioPlayer!
    var cs5player:AVAudioPlayer!
    var d5player:AVAudioPlayer!
    
    
    let chordURL = Bundle.main.url(forResource: "chordSeq1", withExtension: "wav")
    let c4URL = Bundle.main.url(forResource: "c4", withExtension: "mp3")
    let cs4URL = Bundle.main.url(forResource: "c#4", withExtension: "mp3")
    let d4URL = Bundle.main.url(forResource: "d4", withExtension: "mp3")
    let ds4URL = Bundle.main.url(forResource: "d#4", withExtension: "mp3")
    let e4URL = Bundle.main.url(forResource: "e4", withExtension: "mp3")
    let f4URL = Bundle.main.url(forResource: "f4", withExtension: "mp3")
    let fs4URL = Bundle.main.url(forResource: "f#4", withExtension: "mp3")
    let g4URL = Bundle.main.url(forResource: "g4", withExtension: "mp3")
    let gs4URL = Bundle.main.url(forResource: "g#4", withExtension: "mp3")
    let a4URL = Bundle.main.url(forResource: "a4", withExtension: "mp3")
    let as4URL = Bundle.main.url(forResource: "a#4", withExtension: "mp3")
    let b4URL = Bundle.main.url(forResource: "b4", withExtension: "mp3")
    let c5URL = Bundle.main.url(forResource: "c5", withExtension: "mp3")
    let cs5URL = Bundle.main.url(forResource: "c#5", withExtension: "mp3")
    let d5URL = Bundle.main.url(forResource: "d5", withExtension: "mp3")
    
    let pause = UIImage(named: "pause30")
    let play = UIImage(named: "play30")
    
    var playing = false //Boolean used to keep track of whether the chord sequence is currently playing or not.
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func keyVolume(_ sender: UISlider) {
        keyVolume = Double(sender.value)
    }
    
    @IBAction func chordVolume(_ sender: UISlider) {
        chordVolume = Double(sender.value)
        chordPlayer.setVolume(Float(chordVolume), fadeDuration: 0)
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
            sender.setImage(pause, for: UIControlState.normal)
            chordPlayer.setVolume(Float(chordVolume), fadeDuration: 0)
            chordPlayer.play()
            chordPlayer.numberOfLoops = -1
            
        }
        else { //Stops the looping.
            playing = false
            sender.setImage(play, for: UIControlState.normal)
            chordPlayer.stop()
        }
    }
    
   
    @IBAction func plusBtn(_ sender: UIButton) {
        if(availableKeys<15){
            availableKeys = availableKeys + 1
            print(availableKeys)
            switch availableKeys {
            case 2: g4btn.alpha = 1
                g4btn.isEnabled = true
                keysNum.text = "2"
            case 3: e4btn.alpha = 1
                e4btn.isEnabled = true
                keysNum.text = "3"
            case 4: a4btn.alpha = 1
                a4btn.isEnabled = true
                keysNum.text = "4"
            case 5: d4btn.alpha = 1
                d4btn.isEnabled = true
                keysNum.text = "5"
            case 6: f4btn.alpha = 1
                f4btn.isEnabled = true
                keysNum.text = "6"
            case 7: b4btn.alpha = 1
                b4btn.isEnabled = true
                keysNum.text = "7"
            case 8: c5btn.alpha = 1
                c5btn.isEnabled = true
                keysNum.text = "8"
            case 9: d5btn.alpha = 1
                d5btn.isEnabled = true
                keysNum.text = "9"
            case 10: fs4btn.alpha = 1
                fs4btn.isEnabled = true
                keysNum.text = "10"
            case 11: ds4btn.alpha = 1
                ds4btn.isEnabled = true
                keysNum.text = "11"
            case 12: gs4btn.alpha = 1
                gs4btn.isEnabled = true
                keysNum.text = "12"
            case 13: as4btn.alpha = 1
                as4btn.isEnabled = true
                keysNum.text = "13"
            case 14: cs4btn.alpha = 1
                cs4btn.isEnabled = true
                keysNum.text = "14"
            case 15: cs5btn.alpha = 1
                cs5btn.isEnabled = true
                keysNum.text = "15"
            default: print("This ain't it chief")
            }
        }
    }
    
    @IBAction func minusBtn(_ sender: UIButton) {
        if(availableKeys>1){
            availableKeys = availableKeys - 1
            print(availableKeys)
            switch availableKeys {
            case 1: g4btn.alpha = 0.5
                g4btn.isEnabled = false
                keysNum.text = "1"
            case 2: e4btn.alpha = 0.5
                e4btn.isEnabled = false
                keysNum.text = "2"
            case 3: a4btn.alpha = 0.5
                a4btn.isEnabled = false
                keysNum.text = "3"
            case 4: d4btn.alpha = 0.5
                d4btn.isEnabled = false
                keysNum.text = "4"
            case 5: f4btn.alpha = 0.5
                f4btn.isEnabled = false
                keysNum.text = "5"
            case 6: b4btn.alpha = 0.5
                b4btn.isEnabled = false
                keysNum.text = "6"
            case 7: c5btn.alpha = 0.5
                c5btn.isEnabled = false
                keysNum.text = "7"
            case 8: d5btn.alpha = 0.5
                d5btn.isEnabled = false
                keysNum.text = "8"
            case 9: fs4btn.alpha = 0.5
            fs4btn.isEnabled = false
                keysNum.text = "9"
            case 10: ds4btn.alpha = 0.5
            ds4btn.isEnabled = false
                keysNum.text = "10"
            case 11: gs4btn.alpha = 0.5
                gs4btn.isEnabled = false
                keysNum.text = "11"
            case 12: as4btn.alpha = 0.5
                as4btn.isEnabled = false
                keysNum.text = "12"
            case 13: cs4btn.alpha = 0.5
                cs4btn.isEnabled = false
                keysNum.text = "13"
            case 14: cs5btn.alpha = 0.5
                cs5btn.isEnabled = false
                keysNum.text = "14"
            default: print("You've reached the bottom or something")
            }
        }
    }
    
    @IBAction func c4(_ sender: UIButton) {
        do {
            c4player = try AVAudioPlayer(contentsOf: c4URL!)
        }
        catch {
            print(error)
        }
        c4player.setVolume(Float(keyVolume), fadeDuration: 0.0)
        c4player.stop()
        c4player.play()
    }
    
    @IBAction func cs4(_ sender: UIButton) {
        do {
            cs4player = try AVAudioPlayer(contentsOf: cs4URL!)
        }
        catch {
            print(error)
        }
        cs4player.setVolume(Float(keyVolume), fadeDuration: 0.0)
        cs4player.stop()
        cs4player.play()
    
    }
    
    
    
    
    
    @IBAction func d4(_ sender: UIButton) {
        do {
            d4player = try AVAudioPlayer(contentsOf: d4URL!)
        }
        catch {
            print(error)
        }
        d4player.setVolume(Float(keyVolume), fadeDuration: 0.0)
        d4player.stop()
        d4player.play()
    }
    
    @IBAction func ds4(_ sender: UIButton) {
        do {
            ds4player = try AVAudioPlayer(contentsOf: ds4URL!)
        }
        catch {
            print(error)
        }
        ds4player.setVolume(Float(keyVolume), fadeDuration: 0.0)
        ds4player.stop()
        ds4player.play()
    }
    
    @IBAction func e4(_ sender: UIButton) {
        do {
            e4player = try AVAudioPlayer(contentsOf: e4URL!)
        }
        catch {
            print(error)
        }
        e4player.setVolume(Float(keyVolume), fadeDuration: 0.0)
        e4player.stop()
        e4player.play()
    }
    
    @IBAction func f4(_ sender: UIButton) {
        do {
            f4player = try AVAudioPlayer(contentsOf: f4URL!)
        }
        catch {
            print(error)
        }
        f4player.setVolume(Float(keyVolume), fadeDuration: 0.0)
        f4player.stop()
        f4player.play()
    }
    
    @IBAction func fs4(_ sender: UIButton) {
        do {
            fs4player = try AVAudioPlayer(contentsOf: fs4URL!)
        }
        catch {
            print(error)
        }
        fs4player.setVolume(Float(keyVolume), fadeDuration: 0.0)
        fs4player.stop()
        fs4player.play()
    }
    
    @IBAction func g4(_ sender: UIButton) {
        do {
            g4player = try AVAudioPlayer(contentsOf: g4URL!)
        }
        catch {
            print(error)
        }
        g4player.setVolume(Float(keyVolume), fadeDuration: 0.0)
        g4player.stop()
        g4player.play()
    }
    
    @IBAction func gs4(_ sender: UIButton) {
        do {
            gs4player = try AVAudioPlayer(contentsOf: gs4URL!)
        }
        catch {
            print(error)
        }
        gs4player.setVolume(Float(keyVolume), fadeDuration: 0.0)
        gs4player.stop()
        gs4player.play()
    }
    
    @IBAction func a4(_ sender: UIButton) {
        do {
            a4player = try AVAudioPlayer(contentsOf: a4URL!)
        }
        catch {
            print(error)
        }
        a4player.setVolume(Float(keyVolume), fadeDuration: 0.0)
        a4player.stop()
        a4player.play()
    }
    
    @IBAction func as4(_ sender: UIButton) {
        do {
            as4player = try AVAudioPlayer(contentsOf: as4URL!)
        }
        catch {
            print(error)
        }
        as4player.setVolume(Float(keyVolume), fadeDuration: 0.0)
        as4player.stop()
        as4player.play()
    }
    
    @IBAction func b4(_ sender: UIButton) {
        do {
            b4player = try AVAudioPlayer(contentsOf: b4URL!)
        }
        catch {
            print(error)
        }
        b4player.setVolume(Float(keyVolume), fadeDuration: 0.0)
        b4player.stop()
        b4player.play()
    }
    
    @IBAction func c5(_ sender: UIButton) {
        do {
            c5player = try AVAudioPlayer(contentsOf: c5URL!)
        }
        catch {
            print(error)
        }
        c5player.setVolume(Float(keyVolume), fadeDuration: 0.0)
        c5player.stop()
        c5player.play()
    }
    
    @IBAction func cs5(_ sender: UIButton) {
        do {
            cs5player = try AVAudioPlayer(contentsOf: cs5URL!)
        }
        catch {
            print(error)
        }
        cs5player.setVolume(Float(keyVolume), fadeDuration: 0.0)
        cs5player.stop()
        cs5player.play()
    }
    
    @IBAction func d5(_ sender: UIButton) {
        do {
            d5player = try AVAudioPlayer(contentsOf: d5URL!)
        }
        catch {
            print(error)
        }
        d5player.setVolume(Float(keyVolume), fadeDuration: 0.0)
        d5player.stop()
        d5player.play()
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
