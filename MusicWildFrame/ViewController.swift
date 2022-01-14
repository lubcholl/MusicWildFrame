//
//  ViewController.swift
//  MusicWildFrame
//
//  Created by Lyubomir Lazarov on 9/13/21.
//

import UIKit

class ViewController: UIViewController {

    var isPlaying: Bool = true {
        didSet {
            playPauseButton.isSelected = isPlaying
        }
    }
    
    @IBOutlet var albumImageView: UIImageView!
    @IBOutlet var reverseBackground: UIView!
    @IBOutlet var playPauseBackground: UIView!
    @IBOutlet var forwardBackground: UIView!
    @IBOutlet var reverseButton: UIButton!
    @IBOutlet var playPauseButton: UIButton!
    @IBOutlet var forwardButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        reverseBackground.layer.cornerRadius = reverseBackground.frame.height / 2.5
        reverseBackground.clipsToBounds = true
        
        playPauseBackground.layer.cornerRadius = playPauseBackground.frame.height / 2.5
        playPauseBackground.clipsToBounds = true
        
        forwardBackground.layer.cornerRadius = forwardBackground.frame.height / 2.5
        forwardBackground.clipsToBounds = true
        
    }
    
    @IBAction func playPauseButtonTapped(_ sender: UIButton) {
        isPlaying.toggle()
        
        if isPlaying {
            UIView.animate(withDuration: 0.8, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.1, options: [], animations: {
                self.albumImageView.transform = CGAffineTransform.identity
            }, completion: nil)
        } else {
            UIView.animate(withDuration: 0.5) {
                self.albumImageView.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
            }
        }
    }
    
    @IBAction func touchedUpInside(_ sender: UIButton) {
        let buttonBackgorund: UIView
        
        switch sender {
        case reverseButton:
            buttonBackgorund = reverseBackground
        case playPauseButton:
            buttonBackgorund = playPauseBackground
        case forwardButton:
        buttonBackgorund = forwardBackground
        default:
            return
        }
        
        UIView.animate(withDuration: 0.25) {
            buttonBackgorund.alpha = 0.0
            buttonBackgorund.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
            sender.transform = CGAffineTransform.identity
        } completion: { _ in
            buttonBackgorund.transform = CGAffineTransform.identity
        }

    }
    
    @IBAction func touchedDown(_ sender: UIButton) {
        let buttonBackground: UIView
        
        switch sender {
        case reverseButton:
            buttonBackground = reverseBackground
        case playPauseButton:
            buttonBackground = playPauseBackground
        case forwardButton:
            buttonBackground = forwardBackground
        default:
            return
        }
        
        UIView.animate(withDuration: 0.25) {
            buttonBackground.alpha = 0.3
            sender.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
        }
    }
    

}

