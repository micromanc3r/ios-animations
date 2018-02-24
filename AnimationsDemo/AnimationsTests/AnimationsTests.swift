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
        XCTAssertTrue(button.alpha == 1.0)
        button.hideGracefully(completion: { _ in
            XCTAssertTrue(button.alpha == 0.0)
        })
    }
    
}
