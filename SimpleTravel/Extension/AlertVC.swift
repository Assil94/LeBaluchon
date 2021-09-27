//
//  AlertVC.swift
//  SimpleTravel
//
//  Created by Assil Heddar on 19/01/2021.
//

import UIKit

extension UIViewController {
    // MARK: - Methods
    func showErrorAlert(title: String, message: String) {
        let alertVC =
            UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        self.present(alertVC, animated: true, completion: nil)
    }
}
