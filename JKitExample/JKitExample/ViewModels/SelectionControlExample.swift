//
//  SelectionControlExample.swift
//  JKit
//
//  Created by Jarrod Parkes on 6/10/20.
//

import JKit

// MARK: - SelectionControlExample: SelectionControlDisplayable

struct SelectionControlExample: SelectionControlDisplayable {
    let title: String
    
    let tip: String?
    let tipLinkable: Bool
    
    let isSelected: Bool
    let isEnabled: Bool
}
