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
        let alert = Alert(type: .error, message: message, duration: 2.0, anchor: .bottom)
        
        AlertManager.shared.show(alert,
                                 onView: rootViewController.view,
                                 withTheme: theme,
                                 alertHandler: nil,
                                 completionHandler: nil)
    }
}
