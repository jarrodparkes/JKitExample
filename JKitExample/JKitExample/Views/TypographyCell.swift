//
//  TypographyCell.swift
//  JKit
//
//  Created by Jarrod Parkes on 5/11/20.
//

import JKit
import UIKit

// MARK: - TypographyCellDisplayable

protocol TypographyCellDisplayable {
    var fontStyle: FontStyle { get }
    var title: String { get }
    var subtitle: String { get }
}

// MARK: - TypographyCell: BaseTableViewCell

class TypographyCell: BaseTableViewCell {

    // MARK: Initializer

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
    }

    // MARK: Style

    override func styleWith(theme: Theme) {
        super.styleWith(theme: theme)

        selectionStyle = .none
        
        textLabel?.numberOfLines = 0
        detailTextLabel?.numberOfLines = 0
    }

    func styleWith(theme: Theme, displayable: TypographyCellDisplayable) {
        super.styleWith(theme: theme)
        
        let colors = theme.colors
        let textColor = colors.textHighEmphasis
        
        textLabel?.attributedText = displayable.title.attributed(fontStyle: displayable.fontStyle, color: textColor)
        detailTextLabel?.attributedText = displayable.subtitle.attributed(fontStyle: .bodyLarge, color: textColor)
    }
}
