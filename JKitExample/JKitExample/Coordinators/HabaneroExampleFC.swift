//
//  JKitExampleFC.swift
//  JKit
//
//  Created by Jarrod Parkes on 5/12/20.
//

import JKit
import UIKit

// MARK: - JKitExampleFC: BaseFC

class JKitExampleFC: BaseFC {

    // MARK: Helpers

    func displayAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: nil))
        rootViewController.present(alert, animated: true, completion: nil)
    }
}
