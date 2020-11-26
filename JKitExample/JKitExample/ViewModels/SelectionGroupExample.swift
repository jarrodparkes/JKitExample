//
//  SelectionGroupExample.swift
//  JKit
//
//  Created by Jarrod Parkes on 7/29/20.
//

import JKit
import UIKit

// MARK: - SelectionGroupExample: SelectionGroupDisplayable

struct SelectionGroupExample: SelectionGroupDisplayable {
    
    // MARK: Properties
    
    var controls: [SelectionControlDisplayable]
    
    // MARK: SelectionGroupDisplayable
    
    let tag: Int
    let style: SelectionGroupStyle
    
    var isEnabled: Bool
    var selection: Selection
    var choices: [SelectionControlDisplayable] { return controls }
    
    // MARK: Initializer
    
    init(controls: [SelectionControlDisplayable], tag: Int, style: SelectionGroupStyle, selection: Selection) {
        self.controls = controls
        self.tag = tag
        self.style = style
        
        switch (style, selection) {
        case (.single, .single(let index)):
            self.selection = .single(index)
        case (.multi, .multi(let indices)):
            self.selection = .multi(indices)
        case (.single, _):
            self.selection = .single(nil)
        case (.multi, _):
            self.selection = .multi([])
        }
        
        isEnabled = true
    }
    
    init(controls: [SelectionControlDisplayable], tag: Int, style: SelectionGroupStyle) {
        self.controls = controls
        self.tag = tag
        self.style = style
        
        switch style {
        case .single:
            selection = .single(nil)
        case .multi:
            selection = .multi([])
        }
        
        isEnabled = true
    }
}

// MARK: - SelectionGroupExample: MenuDisplayable

extension SelectionGroupExample: MenuDisplayable {
    var selectedIndex: Int? {
        return selection.selectedIndex
    }
    
    var selectedValue: String? {
        if let selectedIndex = selectedIndex {
            return choices[selectedIndex].title
        } else {
            return nil
        }
    }
    
    var placeholder: String {
        return "Choose item."
    }
    
    var pickerTitle: String {
        return "Choose item."
    }
    
    var pickerActionTitle: String {
        return MENU_PICKER_ACTION_TITLE
    }
    
    var pickerDismissTitle: String {
        return MENU_PICKER_DISMISS_TITLE
    }
    
    var numberOfComponents: Int {
        return 1
    }
    
    func numberOfRows(inComponent component: Int) -> Int {
        return choices.count
    }
    
    func defaultSelectedRow(forComponent component: Int) -> Int {
        if let selectedIndex = selectedIndex {
            return selectedIndex
        } else {
            return 0
        }
    }
    
    func widthFactor(forComponent component: Int) -> CGFloat {
        return 1.0
    }
    
    func title(forRow row: Int, component: Int) -> String {
        return choices[row].title
    }
    
    func titleAlignment(forRow row: Int, component: Int) -> NSTextAlignment {
        return .center
    }
}

// MARK: SelectionGroupExample (Mock)

extension SelectionGroupExample {
    static func mock(theme: Theme,
                     tag: Int,
                     numberOfOptions: Int,
                     singleStyle: SelectionGroupSingleStyle,
                     selectedIndex: Int?,
                     isEnabled: Bool = true) -> SelectionGroupExample {
        let controls = (0..<numberOfOptions).map {
            SelectionControlExample(
                title: "Option \($0 + 1)",
                tip: "A tip",
                tipLinkable: false,
                isSelected: false,
                isEnabled: isEnabled)
        }
        
        var group = SelectionGroupExample(controls: controls,
                                          tag: tag,
                                          style: .single(singleStyle),
                                          selection: .single(selectedIndex))
        
        group.isEnabled = isEnabled
        
        return group
    }
    
    static func mock(theme: Theme, tag: Int, numberOfOptions: Int, selectedIndices indices: [Int]) -> SelectionGroupExample {
        let controls = (0..<numberOfOptions).map {
            SelectionControlExample(
                title: "Option \($0 + 1)",
                tip: "A tip",
                tipLinkable: false,
                isSelected: false,
                isEnabled: true)
        }
        
        return SelectionGroupExample(controls: controls,
                                     tag: tag,
                                     style: .multi,
                                     selection: .multi(indices))
    }
    
    static func mockWithVariableChoiceLengths(theme: Theme, tag: Int) -> SelectionGroupExample {
        let illinois = SelectionControlExample(title: "Illinois", tip: nil, tipLinkable: false, isSelected: false, isEnabled: true)
        let indiana = SelectionControlExample(title: "Indiana", tip: nil, tipLinkable: false, isSelected: false, isEnabled: true)
        let michigan = SelectionControlExample(title: "Michigan", tip: nil, tipLinkable: false, isSelected: false, isEnabled: true)
        let ohio = SelectionControlExample(title: "Ohio and I am not a shareholder-employee who is a \"twenty (20) percent or greater\" direct or indirect equity investor in an S corporation", tip: nil, tipLinkable: false, isSelected: false, isEnabled: true)
        let virginia = SelectionControlExample(title: "Virginia and I commute daily to my place of employment in Kentucky", tip: nil, tipLinkable: false, isSelected: false, isEnabled: true)
        let wisconsin = SelectionControlExample(title: "Wisconsin", tip: nil, tipLinkable: false, isSelected: false, isEnabled: true)
        let westVirginia = SelectionControlExample(title: "West Virginia", tip: nil, tipLinkable: false, isSelected: false, isEnabled: true)
        
        let controls = [
            illinois,
            indiana,
            michigan,
            ohio,
            virginia,
            wisconsin,
            westVirginia
        ]
        
        return SelectionGroupExample(controls: controls,
                                     tag: tag,
                                     style: .single(.allChoices),
                                     selection: .single(nil))
    }
}
