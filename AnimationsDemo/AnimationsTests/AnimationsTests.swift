//
//  AnimationsTests.swift
//  AnimationsTests
//
//  Created by Miroslav Sliacky on 24/02/2018.
//  Copyright © 2018 micromanc3r. All rights reserved.
//

import XCTest
@testable import AnimationsDemo

class AnimationsTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testGracefulHide() {
        let button = UIButton()
        let expectation = self.expectation(description: "hide")
        
        XCTAssertTrue(button.alpha == 1.0)
        
        button.hideGracefully(completion: { _ in
            expectation.fulfill()
        })
        
        waitForExpectations(timeout: 1, handler: nil)
        XCTAssertTrue(button.alpha == 0.0)
    }
    
    func testGracefulShow() {
        let button = UIButton()
        let expectation = self.expectation(description: "show")
        
        button.alpha = 0.0
        button.showGracefully(completion: { _ in
            expectation.fulfill()
        })
        
        waitForExpectations(timeout: 1, handler: nil)
        XCTAssertTrue(button.alpha == 1.0)
    }
    
    func testGracefulAlpha() {
        let button = UIButton()
        let expectation = self.expectation(description: "alpha")
        
        XCTAssertTrue(button.alpha == 1.0)
        
        button.setAlphaGracefully(alpha: 0.5,
                                  duration: 0.5,
                                  delay: 0,
                                  options: [.curveEaseIn]) { _ in
                                    expectation.fulfill()
        }
        
        waitForExpectations(timeout: 1, handler: nil)
        XCTAssertTrue(button.alpha == 0.5)
    }
    
    func testGracefulSetImage() {
        let firstImageName = "widow01"
        let firstImage = UIImage.init(named: firstImageName)
        let secondImageName = "widow02"
        let secondImage = UIImage.init(named: secondImageName)
        
        let imageView = UIImageView.init(image: firstImage)
        
        let expectation = self.expectation(description: "image")
        XCTAssertEqual(imageView.image, firstImage)
        
        imageView.setImageGracefully(image: secondImage!) { _ in
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 0.5, handler: nil)
        XCTAssertEqual(imageView.image, secondImage)
    }
}
