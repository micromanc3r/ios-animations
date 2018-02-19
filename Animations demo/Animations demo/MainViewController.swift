//
//  ViewController.swift
//  Animations demo
//
//  Created by Miroslav Sliacky on 25/01/2017.
//  Copyright © 2017 micromanc3r. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    var isFirstImageSet = true
    var duration: TimeInterval = 0.2
    var delay: TimeInterval = 0.0
    let firstImageName = "widow01"
    let secondImageName = "widow02"
    
    @IBOutlet weak var imageView01: UIImageView!
    
    ////////////////////////////
    // MARK: - UIViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView01.image = UIImage.init(named: firstImageName)
    }
    
    ////////////////////////////
    // MARK: - Basic animations
    @IBAction func hideImageView(_ sender: Any) {
        imageView01.hideGracefully()
    }
    
    @IBAction func showImageView(_ sender: Any) {
        imageView01.showGracefully()
    }
    
    @IBAction func bounceInImageView(_ sender: Any) {
        imageView01.bounceIn()
    }
    
    @IBAction func switchImage(_ sender: Any) {
        let newImage = getNextImage()
        imageView01.setImageGracefully(image: newImage)
    }
    
    ////////////////////////////
    // MARK: - Attributed animations
    @IBAction func switchImageAttributed(_ sender: Any) {
        let newImage = getNextImage()
        imageView01.setImageGracefully(image: newImage,
                                       duration: duration,
                                       options: [.transitionCrossDissolve, .curveEaseOut],
                                       completion: nil)
    }
    
    @IBAction func hideImageViewAttributed(_ sender: Any) {
        imageView01.hideGracefully(duration: duration,
                                   delay: delay,
                                   options: [.curveEaseOut],
                                   completion: nil)
    }
    
    @IBAction func showImageViewAttributed(_ sender: Any) {
        imageView01.showGracefully(duration: duration,
                                   delay: delay,
                                   options: [.curveEaseIn],
                                   completion: nil)
    }
    
    @IBAction func bounceInImageViewAttributed(_ sender: Any) {
        imageView01.bounceIn(duration: duration,
                             delay: delay,
                             options: [.allowUserInteraction, .curveEaseOut],
                             completion: nil)
    }
    
    ////////////////////////////
    // MARK: - Attributes setup
    @IBAction func durationChanged(_ sender: UISlider) {
        duration = TimeInterval(sender.value)
    }
    
    @IBAction func delayChanged(_ sender: UISlider) {
        delay = TimeInterval(sender.value)
    }
    
    ////////////////////////////
    // MARK: - private methods
    func getNextImage() -> UIImage {
        isFirstImageSet = !isFirstImageSet
        
        if isFirstImageSet {
            return UIImage.init(named: firstImageName)!
        } else {
            return UIImage.init(named: secondImageName)!
        }
    }
}
