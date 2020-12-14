//
//  ButtonsOutlineVC.swift
//  JKit
//
//  Created by Jarrod Parkes on 6/1/20.
//

import JKit
import UIKit

// MARK: - ButtonsOutlineVC: ButtonsVC

class ButtonsOutlineVC: ButtonsVC {
    
    // MARK: Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Outline Button"
    }
    
    // MARK: ButtonsVC
    
    override func getExampleButtons() -> [UIButton] {
        let outlineButton = Button(frame: CGRect(x: 20, y: 120, width: BUTTON_WIDTH, height: BUTTON_HEIGHT), style: .outline(.black, .black))
        outlineButton.styleWith(theme: theme)
        
        let defaultButton = UIButton(type: .system)
        defaultButton.frame = CGRect(x: 20, y: 220, width: BUTTON_WIDTH, height: BUTTON_HEIGHT)
        
        return [
            outlineButton,            
            defaultButton
        ]
    }
}
