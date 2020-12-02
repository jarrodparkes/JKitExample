//
//  Icon.swift
//  JKit
//
//  Created by Jarrod Parkes on 5/11/20.
//

import JKit
import UIKit

// MARK: - Icon

struct Icon {

    // MARK: Properties

    let name: String
    let image: UIImage?
}

// MARK: - Icon: ActionListCellDisplayable

extension Icon: ActionListCellDisplayable {    
    var icon: UIImage? { return image }
    var title: String { return name }
        
    var subtitle: String? { return nil }
    var accessoryStyle: ActionListAccessoryViews { return .none }
    
    func customIconTintColor(colors: Colors) -> UIColor? { return nil }
    func customTitleTextColor(colors: Colors) -> UIColor? { return nil }
    func customBackgroundColor(colors: Colors) -> UIColor? { return nil }
}
