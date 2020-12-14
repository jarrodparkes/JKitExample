//
//  ButtonExamples.swift
//  JKit
//
//  Created by Jarrod Parkes on 7/30/20.
//

import JKit
import UIKit

// MARK: - ButtonExamples: ExamplesVCDisplayable

struct ButtonExamples: ExamplesVCDisplayable {
    
    // MARK: Properties
    
    let styles: [(String, ButtonStyle)]
    let exampleViews: [UIView]
    
    var titles: [String] { return styles.map { $0.0 } }
    
    // MARK: Initializer
    
    init(styles: [(String, ButtonStyle)]) {
        self.styles = styles
        exampleViews = styles.map { Button(frame: .zero, style: $0.1) }
    }
    
    // MARK: ExamplesVCDisplayable
    
    func exampleView(theme: Theme, indexPath: IndexPath) -> UIView {
        let button = exampleViews[indexPath.row]
        (button as? Button)?.styleWith(theme: theme)
        (button as? Button)?.setTitle(BUTTON_TEXT, for: .normal)
        return button
    }
}

// MARK: - ButtonExamples (Mock)

extension ButtonExamples {
    static func mock(theme: Theme) -> ButtonExamples {
        return ButtonExamples(styles: [
            ("Contained", .contained(.white, .purple)),
            ("Outline", .outline(.black, .purple)),
            ("Text", .text(.black, .center)),
        ])
    }
}

