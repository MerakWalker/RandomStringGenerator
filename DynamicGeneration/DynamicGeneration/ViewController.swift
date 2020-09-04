//
//  ViewController.swift
//  DynamicGeneration
//
//  Created by Senthil Kumar2 on 04/09/20.
//  Copyright © 2020 personal. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let randomString = String.random()
        print(randomString)
        
        let randonNumber = Int.random(from: 100, to: 10000)
        print(randonNumber)
        
    }


}



extension String {

    static func random(length: Int = 10) -> String {
        let base = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        var randomString: String = ""

        for _ in 0..<length {
            let randomValue = arc4random_uniform(UInt32(base.count))
            randomString += "\(base[base.index(base.startIndex, offsetBy: Int(randomValue))])"
        }
        return randomString
    }
}


extension Int {
    static func random(from: Int, to: Int) -> Int {
        guard to > from else {
            assertionFailure("Can not generate negative random numbers")
            return 0
        }
        return Int(arc4random_uniform(UInt32(to - from)) + UInt32(from))
    }
}
