//
//  ColorCell.swift
//  JKit
//
//  Created by Jarrod Parkes on 5/11/20.
//

import JKit
import UIKit

// MARK: - ColorCellDisplayable

protocol ColorCellDisplayable {
    var title: String { get }
    var subtitle: String { get }
    
    func backgroundColor(colors: Colors) -> UIColor?
    func titleColor(colors: Colors) -> UIColor?
}

// MARK: - ColorCell: BaseTableViewCell

class ColorCell: BaseTableViewCell {

    // MARK: Initializer

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
    }

    // MARK: Style

    override func styleWith(theme: Theme) {
        super.styleWith(theme: theme)

        selectionStyle = .none

        let colors = theme.colors

        imageView?.tintColor = colors.textHighEmphasis
        textLabel?.numberOfLines = 0
        detailTextLabel?.numberOfLines = 0
    }

    func styleWith(theme: Theme, displayable: ColorCellDisplayable) {
        super.styleWith(theme: theme)
        
        let colors = theme.colors
        let textColor = displayable.titleColor(colors: colors) ?? colors.textHighEmphasis
        
        backgroundColor = displayable.backgroundColor(colors: colors)
        textLabel?.attributedText = displayable.title.attributed(fontStyle: .labelLarge, color: textColor)
        detailTextLabel?.attributedText = displayable.subtitle.attributed(fontStyle: .bodySmall, color: textColor)
    }
}
