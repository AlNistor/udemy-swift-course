//
//  ViewController.swift
//  Tapper
//
//  Created by Alexandru Nistor on 14/03/16.
//  Copyright © 2016 Alexandru Nistor. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let tapsText : String = " Taps"
    var numberOfTaps : Int = 0
    var numberOfDesiredTaps : Int = 0
    
    // MARK: - IBOutlets
    @IBOutlet weak var logoImage: UIImageView!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var inputTapField: UITextField!
    
    @IBOutlet weak var coinButton: UIButton!
    @IBOutlet weak var tapsLabel: UILabel!
    
    // MARK: - IBActions
    @IBAction func startGameAction(sender: AnyObject) {
        if self.inputTapField.text == "" || Int(self.inputTapField.text!)! <= 0{
            return
        }
        self.numberOfDesiredTaps = Int(self.inputTapField.text!)!
        self.hideMainView()
    }
    
    @IBAction func coinTapped(sender: AnyObject) {
        self.numberOfTaps++
        self.updateTapsLabel()
        
        if self.isGameOver() {
            self.restartGame()
        }
    }
    
    // MARK: - Private Methods
    private func isGameOver() -> Bool {
        if self.numberOfTaps >= self.numberOfDesiredTaps {
            return true
        }
        
        return false
    }
    
    private func updateTapsLabel(){
        self.tapsLabel.text = "\(numberOfTaps) \(self.tapsText)"
    }
    
    private func hideMainView(){
        self.logoImage.hidden = true
        self.playButton.hidden = true
        self.inputTapField.hidden = true
        
        self.coinButton.hidden = false
        self.tapsLabel.hidden = false
        
        self.updateTapsLabel()
    }
    
    private func restartGame(){
        self.logoImage.hidden = false
        self.playButton.hidden = false
        self.inputTapField.hidden = false
        
        self.coinButton.hidden = true
        self.tapsLabel.hidden = true
        
        self.inputTapField.text = ""
        self.numberOfTaps = 0
        self.numberOfDesiredTaps = 0
    }
}

