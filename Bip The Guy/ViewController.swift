//
//  ViewController.swift
//  Bip The Guy
//
//  Created by Joshua Concepcion on 9/20/17.
//  Copyright © 2017 Joshua Concepcion. All rights reserved.
//

import UIKit
import AVFoundation
class ViewController: UIViewController {

    // MARK: Properties
    @IBOutlet weak var imageToPunch: UIImageView!
    var audioPlayer = AVAudioPlayer ()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    // MARK: Functions
    func animateImage() {
        let bounds = self.imageToPunch.bounds
        let shrinkValue: CGFloat = 60
        
        // shrink our image to punch by 60 pixels
        self.imageToPunch.bounds = CGRect (x: self.imageToPunch.bounds.origin.x + shrinkValue, y: self.imageToPunch.bounds.origin.y + shrinkValue, width: self.imageToPunch.bounds.size.width - shrinkValue, height: self.imageToPunch.bounds.size.height - shrinkValue)
        
        UIView.animate(withDuration: 0.25, delay: 0.0,
            usingSpringWithDamping: 0.2,
            initialSpringVelocity: 10, options: [], animations: { self.imageToPunch.bounds  = bounds }, completion: nil)
    }
    
    func playSound(soundName: String, audioPlayer: inout AVAudioPlayer) {
        // Can we load in the file soundName?
        
        if let sound = NSDataAsset(name: soundName) {
            // Check if sound.data is a sound file
            
            do {
                try audioPlayer = AVAudioPlayer(data: sound.data)
                
                audioPlayer.play()
            } catch {
                // If sound.data is not a valid audio file.
                print("Error: data in \(soundName) couldn't be played as a sound")
            }
            
        } else {
            // If NSDataAsset didn't work, tell the user / report the error.
            print("ERROR: File\(soundName) didn't load")
        }
    }

    // MARK: Actions
    
    @IBAction func libraryPressed(_ sender: UIButton) {
    }
    
    @IBAction func cameraPressed(_ sender: UIButton) {
    }
    
    @IBAction func imageTapped(_ sender: UITapGestureRecognizer) {
        animateImage()
        playSound(soundName: "sound0", audioPlayer: &audioPlayer)
    }
    
}

