//
//  Helper.swift
//  Trail Flo
//
//  Created by Nikhil Manapure on 19/01/18.
//
//

import Foundation
import UIKit

extension UITextField {
    func shake() {
        let animation = CAKeyframeAnimation(keyPath: "transform.translation.x")
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        animation.duration = 0.4
        animation.values = [-10, 10, -10, 10, -5, 5, -2, 2, 0 ]
        layer.add(animation, forKey: "shake")
    }
    
    func selectFull() {
        selectedTextRange = textRange(from: beginningOfDocument, to: endOfDocument)
    }
}

class BorderedView: UIView {
    override func draw(_ rect: CGRect) {
        layer.borderColor = UIColor.lightGray.cgColor
        layer.borderWidth = 0.5
    }
}
