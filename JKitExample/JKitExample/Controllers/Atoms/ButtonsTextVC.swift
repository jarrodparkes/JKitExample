//
//  ButtonsTextVC.swift
//  JKit
//
//  Created by Jarrod Parkes on 6/1/20.
//

import JKit
import UIKit

// MARK: - ButtonsTextVC: ButtonsVC

class ButtonsTextVC: ButtonsVC {
    
    // MARK: Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Text Button"
    }
    
    // MARK: ButtonsVC
    
    override func getExampleButtons() -> [UIButton] {
        let textButton = Button(frame: CGRect(x: 20, y: 120, width: BUTTON_WIDTH, height: BUTTON_HEIGHT),
                                style: .text(.black, .left))
        textButton.styleWith(theme: theme)
        
        let defaultButton = UIButton(type: .system)
        defaultButton.frame = CGRect(x: 20, y: 220, width: BUTTON_WIDTH, height: BUTTON_HEIGHT)
        
        return [
            textButton,
            defaultButton
        ]
    }
}
