//
//  TextInputExample.swift
//  JKit
//
//  Created by Jarrod Parkes on 7/10/20.
//

import JKit
import UIKit

// MARK: - TextInputExample: TextInputDisplayable

struct TextInputExample: TextInputDisplayable {
                    
    // MARK: UIKeyboardDisplayable
    
    let keyboardType: UIKeyboardType
    let textContentType: UITextContentType?
    let autocorrectionType: UITextAutocorrectionType
    let autocapitalizationType: UITextAutocapitalizationType
    let returnKeyType: UIReturnKeyType
    
    // MARK: TextInputDisplayable
    
    let label: String
    let placeholder: String?
    let tip: String?
    let useSecureTextEntry: Bool
    let icon: UIImage?
    let multiline: Bool
    let showCharacterCount: Bool
    let format: TextInputFormat?
    let editable: Bool
    
    var value: String
    var error: Error?
    
    func customCharacterCount(constants: Constants) -> UInt {
        return defaultCharacterCount(constants: constants)
    }
}

// MARK: TestInputExample (Mock)

extension TextInputExample {
    static func mock(theme: Theme) -> [TextInputExample] {
        return mockTextExamples(theme: theme)
    }
    
    private static func mockTextExamples(theme: Theme) -> [TextInputExample] {
        let images = theme.images
        
        return [
            TextInputExample(keyboardType: .numberPad,
                             textContentType: nil,
                             autocorrectionType: .no,
                             autocapitalizationType: .none,
                             returnKeyType: .done,
                             label: "Social Security Number",
                             placeholder: "###-##-####",
                             tip: "Don't worry. We'll keep it secure!",
                             useSecureTextEntry: false,
                             icon: images.lock,
                             multiline: false,
                             showCharacterCount: true,
                             format: .string(textPattern: "###-##-####", patternSymbol: "#", allowedSymbolsRegex: "[0-9]"),
                             editable: true,
                             value: "",
                             error: nil),
            TextInputExample(keyboardType: .alphabet,
                             textContentType: nil,
                             autocorrectionType: .no,
                             autocapitalizationType: .none,
                             returnKeyType: .default,
                             label: "Biography",
                             placeholder: "Enter a short biography here.",
                             tip: "Keep it brief.",
                             useSecureTextEntry: false,
                             icon: nil,
                             multiline: true,
                             showCharacterCount: true,
                             format: nil,
                             editable: true,
                             value: "",
                             error: nil)
        ]
    }
    
    private static func mockNumberExamples(theme: Theme) -> [TextInputExample] {
        let images = theme.images
        
        return [
            TextInputExample(keyboardType: .numberPad,
                             textContentType: nil,
                             autocorrectionType: .no,
                             autocapitalizationType: .none,
                             returnKeyType: .done,
                             label: "Tip",
                             placeholder: "$0",
                             tip: "How much tip are you taking home?",
                             useSecureTextEntry: false,
                             icon: images.money,
                             multiline: false,
                             showCharacterCount: false,
                             format: .dollars(maxDollars: nil, useCents: false),
                             editable: true,
                             value: "",
                             error: nil),
            TextInputExample(keyboardType: .numberPad,
                             textContentType: nil,
                             autocorrectionType: .no,
                             autocapitalizationType: .none,
                             returnKeyType: .done,
                             label: "Tip",
                             placeholder: "$0.00",
                             tip: "How much tip are you taking home?",
                             useSecureTextEntry: false,
                             icon: images.money,
                             multiline: true,
                             showCharacterCount: false,
                             format: .dollars(maxDollars: 10, useCents: true),
                             editable: true,
                             value: "",
                             error: nil)
        ]
    }
}
