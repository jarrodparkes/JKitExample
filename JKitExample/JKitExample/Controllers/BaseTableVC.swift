//
//  BaseTableVC.swift
//  JKit
//
//  Created by Jarrod Parkes on 7/29/20.
//

import JKit
import UIKit

// MARK: - TableVCSizer

protocol TableVCSizer: class {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat
    func tableView(_ tableView: UITableView, estimatedHeightForHeaderInSection section: Int) -> CGFloat
    func tableView(_ tableView: UITableView, estimatedHeightForFooterInSection section: Int) -> CGFloat
}

// MARK: - BaseTableVCSizer: TableVCSizer

class BaseTableVCSizer: TableVCSizer {

    // MARK: TableVCSizer

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return CGFloat.leastNonzeroMagnitude
    }

    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return CGFloat.leastNonzeroMagnitude
    }

    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 10
    }

    func tableView(_ tableView: UITableView, estimatedHeightForHeaderInSection section: Int) -> CGFloat {
        return 10
    }

    func tableView(_ tableView: UITableView, estimatedHeightForFooterInSection section: Int) -> CGFloat {
        return 10
    }
}

// MARK: - BaseTableVC: UITableViewController

class BaseTableVC: UITableViewController {

    // MARK: Properties

    let theme: Theme
    let sizer: TableVCSizer

    // MARK: Initializer

    init(theme: Theme, sizer: TableVCSizer) {
        self.theme = theme
        self.sizer = sizer
        super.init(style: .plain)
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: UITableViewDelegate
    
    override final func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return sizer.tableView(tableView, heightForRowAt: indexPath)
    }

    override final func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return sizer.tableView(tableView, heightForHeaderInSection: section)
    }

    override final func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return sizer.tableView(tableView, heightForFooterInSection: section)
    }

    override final func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return sizer.tableView(tableView, estimatedHeightForRowAt: indexPath)
    }

    override final func tableView(_ tableView: UITableView, estimatedHeightForHeaderInSection section: Int) -> CGFloat {
        return sizer.tableView(tableView, estimatedHeightForHeaderInSection: section)
    }

    override final func tableView(_ tableView: UITableView, estimatedHeightForFooterInSection section: Int) -> CGFloat {
        return sizer.tableView(tableView, estimatedHeightForFooterInSection: section)
    }
}
