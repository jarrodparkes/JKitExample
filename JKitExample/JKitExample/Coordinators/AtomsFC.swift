//
//  AtomsFC.swift
//  JKit
//
//  Created by Jarrod Parkes on 5/12/20.
//

import JKit
import UIKit

// MARK: - AtomsFCDelegate

protocol AtomsFCDelegate: class {
    func atomsFCShouldDismiss(_ atomsFC: AtomsFC)
}

// MARK: - AtomsFC: JKitExampleFC

class AtomsFC: JKitExampleFC {
    
    // MARK: Properties
    
    override var rootViewController: UIViewController { return navigationController }
    
    lazy var navigationController: UINavigationController = {
        let navigationController = UINavigationController()
        navigationController.modalPresentationStyle = .fullScreen
        return navigationController
    }()
    
    weak var delegate: AtomsFCDelegate?
    
    // MARK: Start
    
    override func start() {
        let atomsVC = ActionListVC(theme: theme,
                                          title: "Atoms",
                                          items: [
                                            "Contained Button (Interactive)",
                                            "Outline Button (Interactive)",
                                            "Text Button (Interactive)",
                                            "Button (Styles)",
                                            "Bar Button",
                                            "Checkbox Button",
                                            "Radio Button",
                                            "Menu",
                                            "Text Input (Styles)",
                                            "Text Input (Interactive)",
                                            "Status View (Styles)",
                                            "Alerts (Styles)"],
                                          forceBackable: true)
        atomsVC.delegate = self
        
        navigationController.setViewControllers([atomsVC], animated: true)
    }
}

// MARK: - AtomsFC: ActionListVCDelegate

extension AtomsFC: ActionListVCDelegate {
    func actionListVCTappedDismiss(_ actionListVC: ActionListVC) {
        delegate?.atomsFCShouldDismiss(self)
    }
    
    func actionListVCTappedRow(_ actionListVC: ActionListVC, row: Int) {
        let controller: UIViewController?
        
        switch row {
        case 0: controller = ButtonsContainedVC(theme: theme)
        case 1: controller = ButtonsOutlineVC(theme: theme)
        case 2: controller = ButtonsTextVC(theme: theme)
        case 3: controller = ExamplesVC.buttons(theme: theme)
        case 4: controller = ButtonsBarVC(theme: theme)
        case 5: controller = SelectionControlVC(theme: theme, type: .checkbox)
        case 6: controller = SelectionControlVC(theme: theme, type: .radio)
        case 7: controller = MenuVC(theme: theme)
        case 8: controller = ExamplesVC.textInputs(theme: theme)
        case 9: controller = TextInputVC(theme: theme)
        case 10: controller = ExamplesVC.statusViews(theme: theme)
        case 11: controller = ExamplesVC.alerts(theme: theme)
        default: controller = nil
        }
        
        if let controller = controller {
            navigationController.pushViewController(controller, animated: true)
        } else {
            displayAlert(title: "Not Implemented", message: "TBD. Ask Jarrod.")
        }
    }
}
