//
//  FooterVC.swift
//  JKit
//
//  Created by Jarrod Parkes on 9/5/20.
//

import JKit
import UIKit

// MARK: - FooterVC: BaseTableVC

class FooterVC: BaseTableVC {
    
    // MARK: Properties
        
    let footer = Footer(frame: .zero)
            
    // MARK: Initializer
    
    init(theme: Theme) {
        super.init(theme: theme, sizer: BaseTableVCSizer())
        title = "Footer"
    }
    
    // MARK: Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = theme.colors.backgroundCell
        
        tableView.separatorInset = .zero
        tableView.showsVerticalScrollIndicator = false
        tableView.registerCellWithType(ActionListCell.self)
        
        let checkbox = SelectionControlExample(title: "Checkbox",
                                               tip: "A link to something.",
                                               tipLinkable: true,
                                               isSelected: false,
                                               isEnabled: true)
        
        footer.delegate = self
        footer.styleWith(theme: theme, displayable: FooterModel(buttonState: .center("Center", .white, .purple),
                                                                content: .checkbox(checkbox, "https://spurwork.com")))
        
        view.addSubview(footer)
    }
    
    // MARK: UITableViewDataSource

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: ActionListCell = tableView.dequeueReusableCellWithExplicitType(forIndexPath: indexPath)
        cell.styleWith(theme: theme, displayable: ActionListItem(icon: nil, title: "Title \(indexPath.row)", navigationStyle: .none))
        return cell
    }
}

// MARK: - FooterVC: FooterDelegate

extension FooterVC: FooterDelegate {
    func footerButtonWasTapped(_ footer: Footer, position: FooterButtonPosition) {
        print("footer button at \(position) was tapped")
    }
    
    func footerLabelWasTapped(_ footer: Footer) {
        print("footer label was tapped")
    }
    
    func footerCheckboxWasTapped(_ footer: Footer, isSelected: Bool) {
        print("footer checkbox was tapped. isSelected: \(isSelected)")
    }
    
    func footerTipWasTapped(_ footer: Footer, backedValue: Any) {
        print(backedValue)
    }
}
