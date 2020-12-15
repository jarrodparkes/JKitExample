//
//  BaseVC.swift
//  JKit
//
//  Created by Jarrod Parkes on 2020/12/15.
//

import JKit
import UIKit

// MARK: - BaseVC: UIViewController

class BaseVC: UIViewController {
    
    // MARK: Properties
    
    let theme: Theme
    
    // MARK: Initializer
    
    init(theme: Theme) {
        self.theme = theme
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

