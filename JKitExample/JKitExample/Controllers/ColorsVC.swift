//
//  ColorsVC.swift
//  JKit
//
//  Created by Jarrod Parkes on 5/11/20.
//

import JKit
import UIKit

// MARK: - ColorsVC: BaseTableVC

class ColorsVC: BaseTableVC {

    // MARK: Properties

    var colors: [ColorCellDisplayable] = []

    // MARK: Initializer

    init(theme: Theme, colors: [ColorCellDisplayable]) {
        super.init(theme: theme, sizer: BaseTableVCSizer())

        self.title = "Colors"
        self.colors = colors
    }

    // MARK: Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        let colors = theme.colors
        view.backgroundColor = colors.backgroundCell
        
        tableView.separatorInset = .zero
        tableView.registerCellWithType(ColorCell.self)
    }

    // MARK: UITableViewDataSource

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return colors.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: ColorCell = tableView.dequeueReusableCellWithExplicitType(forIndexPath: indexPath)
        cell.styleWith(theme: theme, displayable: colors[indexPath.row])
        return cell
    }
}
