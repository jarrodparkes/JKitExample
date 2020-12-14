//
//  ButtonsContainedVC.swift
//  JKit
//
//  Created by Jarrod Parkes on 05/06/2020.
//

import JKit
import UIKit

// MARK: - ButtonsContainedVC: ButtonsVC

class ButtonsContainedVC: ButtonsVC {

    // MARK: Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Contained Button"
    }
    
    // MARK: ButtonsVC
        
    override func getExampleButtons() -> [UIButton] {
        let containedButton = Button(frame: CGRect(x: 20, y: 120, width: BUTTON_WIDTH, height: BUTTON_HEIGHT), style: .contained(.white, .purple))
        containedButton.styleWith(theme: theme)
        
        let defaultButton = UIButton(type: .system)
        defaultButton.frame = CGRect(x: 20, y: 170, width: BUTTON_WIDTH, height: BUTTON_HEIGHT)
        
        return [
            containedButton,            
            defaultButton
        ]
    }
}
