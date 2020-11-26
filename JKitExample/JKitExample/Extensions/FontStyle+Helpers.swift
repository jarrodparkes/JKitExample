//
//  FontStyle+Helpers.swift
//  JKit
//
//  Created by Jarrod Parkes on 5/11/20.
//

import JKit

// MARK: - FontStyle: TypographyCellDisplayable

extension FontStyle: TypographyCellDisplayable {
    var fontStyle: FontStyle { return self }
    var title: String { return "\(rawValue) / System" }
    var subtitle: String { return "\(sketchFontSize) / \(letterSpacing) letter-spacing / \(sketchLineHeight)" }
}
