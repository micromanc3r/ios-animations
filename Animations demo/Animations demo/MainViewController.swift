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
    let firstImageName = "widow01"
    let secondImageName = "widow02"

    @IBOutlet weak var imageView01: UIImageView!

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

        let newImage: UIImage

        if isFirstImageSet {
            newImage = UIImage.init(named: self.secondImageName)!
        } else {
            newImage = UIImage.init(named: self.firstImageName)!
        }

        imageView01.setImageGracefully(image: newImage)
        isFirstImageSet = !isFirstImageSet
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        imageView01.image = UIImage.init(named: "widow01")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
