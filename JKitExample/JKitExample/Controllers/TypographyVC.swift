//
//  TypographyVC.swift
//  JKit
//
//  Created by Jarrod Parkes on 5/11/20.
//

import JKit
import UIKit

// MARK: - TypographyVC: BaseTableVC

class TypographyVC: BaseTableVC {

    // MARK: Properties

    var fontStyles: [TypographyCellDisplayable] = []

    // MARK: Initializer

    init(theme: Theme, fontStyles: [TypographyCellDisplayable]) {
        super.init(theme: theme, sizer: BaseTableVCSizer())

        self.title = "Typographic Scale"
        self.fontStyles = fontStyles
    }

    // MARK: Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        let colors = theme.colors
        view.backgroundColor = colors.backgroundCell
        
        tableView.separatorInset = .zero
        tableView.registerCellWithType(TypographyCell.self)
    }

    // MARK: UITableViewDataSource

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fontStyles.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: TypographyCell = tableView.dequeueReusableCellWithExplicitType(forIndexPath: indexPath)
        cell.styleWith(theme: theme, displayable: fontStyles[indexPath.row])
        return cell
    }
}
