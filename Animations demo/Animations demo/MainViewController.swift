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

        imageView01.image = UIImage.init(named: "widow01")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    ////////////////////////////
    // MARK: - Basic animations
    @IBAction func hideImageView(_ sender: Any) {
        self.imageView01.hideGracefully(completion: nil)
    }

    @IBAction func showImageView(_ sender: Any) {
        self.imageView01.showGracefully(completion: nil)
    }

    @IBAction func bounceInImageView(_ sender: Any) {
        self.imageView01.bounceIn(completion: nil)
    }

    @IBAction func switchImage(_ sender: Any) {
        let newImage = self.getNextImage()
        imageView01.setImageGracefully(image: newImage)
    }

    ////////////////////////////
    // MARK: - Attributed animations
    @IBAction func switchImageAttributed(_ sender: Any) {
        let newImage = self.getNextImage()
        imageView01.setImageGracefully(image: newImage,
                                       duration: self.duration,
                                       options: [.transitionCrossDissolve, .curveEaseOut],
                                       completion: nil)
    }

    @IBAction func hideImageViewAttributed(_ sender: Any) {
        self.imageView01.hideGracefully(duration: self.duration,
                                        delay: self.delay,
                                        options: [.curveEaseOut],
                                        completion: nil)
    }

    @IBAction func showImageViewAttributed(_ sender: Any) {
        self.imageView01.showGracefully(duration: self.duration,
                                        delay: self.delay,
                                        options: [.curveEaseIn],
                                        completion: nil)
    }

    @IBAction func bounceInImageViewAttributed(_ sender: Any) {
        self.imageView01.bounceIn(duration: self.duration,
                                  delay: self.delay,
                                  options: [.allowUserInteraction, .curveEaseOut],
                                  completion: nil)
    }

    ////////////////////////////
    // MARK: - Attributes setup
    @IBAction func durationChanged(_ sender: UISlider) {
        self.duration = TimeInterval(sender.value)
    }

    @IBAction func delayChanged(_ sender: UISlider) {
        self.delay = TimeInterval(sender.value)
    }

    ////////////////////////////
    // MARK: - private methods
    func getNextImage() -> UIImage {
        isFirstImageSet = !isFirstImageSet

        if isFirstImageSet {
            return UIImage.init(named: self.firstImageName)!
        } else {
            return UIImage.init(named: self.secondImageName)!
        }
    }
}
