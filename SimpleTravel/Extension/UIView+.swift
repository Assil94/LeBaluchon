//
//  UIView+.swift
//  SimpleTravel
//
//  Created by Assil Heddar on 04/10/2021.
//

import UIKit

extension UIView {
    func rotateIt() {
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseIn, animations: { () -> Void in
            self.transform = CGAffineTransform(rotationAngle: .pi)
        })
        self.transform = CGAffineTransform.identity
    }
}
