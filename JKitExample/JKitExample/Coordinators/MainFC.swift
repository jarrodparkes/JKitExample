//
//  MainFC.swift
//  JKit
//
//  Created by Jarrod Parkes on 5/12/20.
//

import JKit
import UIKit

// MARK: - MainFC: JKitExampleFC

class MainFC: JKitExampleFC {
    
    // MARK: Properties
    
    override var rootViewController: UIViewController { return navigationController }
    
    lazy var navigationController: UINavigationController = {
        let navigationController = UINavigationController()
        navigationController.modalPresentationStyle = .fullScreen
        return navigationController
    }()
    
    weak var window: UIWindow?
    
    // MARK: Initializer
    
    init(window: UIWindow, theme: Theme) {
        self.window = window
        
        super.init(theme: theme)
        
        window.rootViewController = rootViewController
        window.makeKeyAndVisible()
    }
    
    // MARK: Start
    
    override func start() {
        let habaneroVC = ActionListVC(theme: theme,
                                             title: "JKit",
                                             items: [
                                                "Typographic Scale",
                                                "Icons",
                                                "Colors",
                                                "Atoms",
                                                "Components",
                                                "Transitions",
                                                "Screens"])
        habaneroVC.delegate = self
        
        navigationController.setViewControllers([habaneroVC], animated: true)
    }
    
    // MARK: Helpers (Subflows)
    
    func startAtomsFC() {
        let atomsFC = AtomsFC(theme: theme)
        atomsFC.delegate = self
        atomsFC.start()
        
        addChildFC(atomsFC)
        rootViewController.present(atomsFC.rootViewController, animated: true)
    }
    
    func startComponentsFC() {
        let componentsFC = ComponentsFC(theme: theme)
        componentsFC.delegate = self
        componentsFC.start()
        
        addChildFC(componentsFC)
        rootViewController.present(componentsFC.rootViewController, animated: true)
    }
    
    // MARK: Helpers
    
    func startTypographyVC() {
        let fontStyles: [FontStyle] = [
            .h1,
            .h2,
            .h3,
            .h4,
            .label,
            .body,
            .caption]
        
        let typographyVC = TypographyVC(fontStyles: fontStyles)
        navigationController.pushViewController(typographyVC, animated: true)
    }
    
    func startIconsVC() {
        let images = theme.images
        
        let icons = [
            Icon(name: "Add", image: images.add),
            Icon(name: "Bell", image: images.bell),            
            Icon(name: "Camera", image: images.camera),
            Icon(name: "CaretDown", image: images.caretDown),
            Icon(name: "CaretLeft", image: images.caretLeft),
            Icon(name: "CaretLeftThick", image: images.caretLeftThick),
            Icon(name: "CaretRight", image: images.caretRight),
            Icon(name: "CaretRightThick", image: images.caretRightThick),
            Icon(name: "CaretUp", image: images.caretUp),
            Icon(name: "CheckCircle", image: images.checkCircle),
            Icon(name: "CheckSmall", image: images.checkSmall),
            Icon(name: "Clipboard", image: images.clipboard),
            Icon(name: "Close", image: images.close),
            Icon(name: "CloseCircle", image: images.closeCircle),
            Icon(name: "Edit", image: images.edit),
            Icon(name: "Email", image: images.email),
            Icon(name: "Error", image: images.error),
            Icon(name: "FaceSmile", image: images.faceSmile),
            Icon(name: "Folder", image: images.folder),
            Icon(name: "Gear", image: images.gear),
            Icon(name: "HeartPlus", image: images.heartPlus),
            Icon(name: "Help", image: images.help),
            Icon(name: "Info", image: images.info),
            Icon(name: "LightBulb", image: images.lightBulb),
            Icon(name: "Lock", image: images.lock),
            Icon(name: "Logout", image: images.logout),
            Icon(name: "Menu", image: images.menu),
            Icon(name: "Money", image: images.money),
            Icon(name: "Notes", image: images.notes),
            Icon(name: "Parking", image: images.parking),
            Icon(name: "PhoneCall", image: images.phoneCall),
            Icon(name: "Profile", image: images.profile),
            Icon(name: "Search", image: images.search),
            Icon(name: "TimeClock", image: images.timeClock),
            Icon(name: "Uniform", image: images.uniform),
            Icon(name: "User", image: images.user),
            Icon(name: "Warning", image: images.warning)
        ]
        
        let iconsVC = ActionListVC(theme: theme, title: "Icons", items: icons)
        navigationController.pushViewController(iconsVC, animated: true)
    }
    
    func startColorsVC() {
        let colors = [
            Color(category: .primary, name: "Example", color: .purple, textColor: .white),
            Color(category: .grayscale, name: "Black", color: .black, textColor: .white),
            Color(category: .grayscale, name: "Dark Gray", color: .darkGray, textColor: .white),
            Color(category: .grayscale, name: "Gray", color: .gray, textColor: .white),
            Color(category: .grayscale, name: "Light Gray", color: .lightGray, textColor: .white),
            Color(category: .grayscale, name: "White", color: .white, textColor: .black),
            Color(category: .state, name: "Example Status", color: .blue, textColor: .white),
            Color(category: .state, name: "Example Success", color: .green, textColor: .black),
            Color(category: .state, name: "Example Warning", color: .yellow, textColor: .black),
            Color(category: .state, name: "Example Error", color: .red, textColor: .black),
        ]
        
        let colorsVC = ColorsVC(colors: colors)
        navigationController.pushViewController(colorsVC, animated: true)
    }
}

// MARK: - MainFC: ActionListVCDelegate

extension MainFC: ActionListVCDelegate {
    func actionListVCTappedDismiss(_ actionListVC: ActionListVC) {}
    
    func actionListVCTappedRow(_ actionListVC: ActionListVC, row: Int) {
        switch row {
        case 0: startTypographyVC()
        case 1: startIconsVC()
        case 2: startColorsVC()
        case 3: startAtomsFC()
        case 4: startComponentsFC()
        default: displayAlert(title: "Not Implemented", message: "TBD. Ask Jarrod.")
        }
    }
}

// MARK: - MainFC: AtomsFCDelegate

extension MainFC: AtomsFCDelegate {
    func atomsFCShouldDismiss(_ atomsFC: AtomsFC) {
        removeChildFC(atomsFC)
        rootViewController.dismiss(animated: true)
    }
}

// MARK: - MainFC: ComponentsFCDelegate

extension MainFC: ComponentsFCDelegate {
    func componentsFCShouldDismiss(_ componentsFC: ComponentsFC) {
        removeChildFC(componentsFC)
        rootViewController.dismiss(animated: true)
    }
}
