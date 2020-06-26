//
//  ViewController.swift
//  HOMEWORKE00
//
//  Created by Davit on 10/7/7512 ERA0.
//  Copyright © 7512 ERA0 Davit. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var constraintX: NSLayoutConstraint!
    
    @IBOutlet weak var constraintY: NSLayoutConstraint!
    var X :CGFloat!
    override func viewDidLoad() {
        super.viewDidLoad()
        X = constraintY.constant
    }

    @IBAction func button(_ sender: Any) {
        cikl(position: .bottomLeft)
        
    }
    func cikl(position: Position) {
    var pos = position
    changePosition(pos: pos)
        
    UIView.animate(withDuration: 2, delay: 0.0, options: .curveEaseIn, animations: {
        self.view.layoutIfNeeded()
    }) { (finished) in
        if finished {
            pos.next()
            self.cikl(position: pos)
    }
    
}


}
    func changePosition(pos: Position) {
        switch pos {
        case .bottomLeft:
            self.constraintY.constant = 120
            self.constraintX.constant = 50
        case .bottomRight:
            self.constraintY.constant = 200
            self.constraintX.constant = 50
        case .topRight:
            self.constraintY.constant = 240
            self.constraintX.constant = 130
        case .topLeft:
            self.constraintY.constant = 90
            self.constraintX.constant = 130
        case .bottomLeft1:
            self.constraintY.constant = 120
            self.constraintX.constant = 180
        case .topLeft1:
            self.constraintY.constant = 200
            self.constraintX.constant = 180
        }
    }
}
enum Position: Int, CaseIterable {
    case topLeft
    case bottomLeft
    case bottomRight
    case topRight
    case topLeft1
    case bottomLeft1
    
    mutating func next() {
        let allCases = type(of: self).allCases
        self = allCases[(allCases.firstIndex(of: self)! + 1) % allCases.count]
    }
}

