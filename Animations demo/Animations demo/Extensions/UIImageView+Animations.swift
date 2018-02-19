//
//  UIImageView+Animations.swift
//  Animations demo
//
//  Created by Miroslav Sliacky on 28/01/2017.
//  Copyright © 2017 micromanc3r. All rights reserved.
//

import UIKit

extension UIImageView {
    
    /// Function that changes image in UIImageView in animated fashion.
    /// The animation can be modified with the parameters.
    ///
    /// - Parameters:
    ///   - image: new image to display in UIImageView
    ///   - duration: duration of the animation
    ///   - options: UIViewAnimationOption to change animation behavior (.transitionCrossDissolve is recommended)
    ///   - completion: completion handler that's being called after the animation has finished
    func setImageGracefully(image: UIImage,
                            duration: TimeInterval,
                            options: UIViewAnimationOptions,
                            completion: ((Bool) -> Void)? = nil) {
        UIView.transition(with: self,
                          duration: duration,
                          options: options,
                          animations: {
                            self.image = image
        },
                          completion: completion)
    }
    
    /// Default function to change image in UIImageView in animated fashion
    ///
    /// - Parameter image: new image to display in UIImageView
    func setImageGracefully(image: UIImage, completion: ((Bool) -> Void)? = nil) {
        setImageGracefully(image: image,
                           duration: 0.4,
                           options: [.transitionCrossDissolve, .curveEaseOut],
                           completion: completion)
    }
    
}
