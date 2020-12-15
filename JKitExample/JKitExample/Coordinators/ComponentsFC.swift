//
//  ComponentsFC.swift
//  JKit
//
//  Created by Jarrod Parkes on 5/12/20.
//

import JKit
import UIKit

// MARK: - ComponentsFCDelegate

protocol ComponentsFCDelegate: class {
    func componentsFCShouldDismiss(_ componentsFC: ComponentsFC)
}

// MARK: - ComponentsFC: JKitExampleFC

class ComponentsFC: JKitExampleFC {
    
    // MARK: Properties
    
    override var rootViewController: UIViewController { return navigationController }
    
    lazy var navigationController: UINavigationController = {
        let navigationController = UINavigationController()
        navigationController.modalPresentationStyle = .fullScreen
        return navigationController
    }()
    
    weak var delegate: ComponentsFCDelegate?
    
    // MARK: Start
    
    override func start() {
        let componentsVC = ActionListVC(theme: theme,
                                        title: "Components",
                                        items: [
                                            "Action List",
                                            "Selection Group (Styles)",
                                            "Selection Group (Single)",
                                            "Selection Group (Multiple)",
                                            "Calendar (View Only)",
                                            "Calendar (Single Select)",
                                            "Calendar (Multi Select)",
                                            "Calendar (Single Range)",
                                            "Calendar (Multi Range)",
                                            "Footer",
                                            "Notes",
                                            "Notes (Styles)"],
                                        forceBackable: true)
        componentsVC.delegate = self
        
        navigationController.setViewControllers([componentsVC], animated: true)
    }
    
    // MARK: Helpers
    
    private func actionListStylesVC() -> UIViewController {
        let images = theme.images
        let items = [
            ActionListItem(icon: images.gear, title: "Title", subtitle: "Subtitle", accessoryStyle: .detailAndNavigation(ActionListDetail(detail: "Detail"), .push), customIconTintColor: .red),
            ActionListItem(icon: images.gear, title: "Title", subtitle: "Subtitle", accessoryStyle: .detailAndNavigation(ActionListDetail(detail: "Detail"), .present), customTitleTextColor: .green),
            ActionListItem(icon: images.gear, title: "Title", subtitle: "Subtitle", accessoryStyle: .detailAndNavigation(ActionListDetail(detail: "Detail"), .none)),
            ActionListItem(icon: images.gear, title: "Title", subtitle: "Subtitle", accessoryStyle: .detailOnly(ActionListDetail(detail: "Detail", customTextColor: .purple))),
            ActionListItem(icon: images.gear, title: "Title", subtitle: "Subtitle", accessoryStyle: .detailOnly(nil)),
            ActionListItem(icon: images.gear, title: "Title", subtitle: nil, accessoryStyle: .detailOnly(ActionListDetail(detail: "Detail"))),
            ActionListItem(icon: nil, title: "Title", subtitle: nil, accessoryStyle: .statusAndDetail(SimpleStatus(status: "Status", type: .success), ActionListDetail(detail: "Detail"))),
            ActionListItem(icon: nil, title: "Title", subtitle: "Subtitle", accessoryStyle: .detailOnly(nil)),
            ActionListItem(icon: nil, title: "Title", subtitle: nil, accessoryStyle: .detailOnly(ActionListDetail(detail: "Detail"))),
            ActionListItem(icon: nil, title: "Title", subtitle: nil, accessoryStyle: .none),
            ActionListItem(icon: nil, title: "Title", subtitle: "Subtitle", accessoryStyle: .none),
            ActionListItem(icon: nil, title: "Title", subtitle: nil, accessoryStyle: .detailOnly(nil)),
            ActionListItem(icon: nil, title: "Title", subtitle: nil, accessoryStyle: .detailAndNavigation(nil, .push)),
            ActionListItem(icon: nil, title: "Title", subtitle: "Subtitle", accessoryStyle: .detailAndNavigation(nil, .push))
        ]
        return ActionListVC(theme: theme, title: "Action List", items: items)
    }
}

// MARK: - ComponentsFC: ActionListVCDelegate

extension ComponentsFC: ActionListVCDelegate {
    func actionListVCTappedDismiss(_ actionListVC: ActionListVC) {
        delegate?.componentsFCShouldDismiss(self)
    }
    
    func actionListVCTappedRow(_ actionListVC: ActionListVC, row: Int) {
        let controller: UIViewController?
        
        switch row {
        case 0: controller = actionListStylesVC()
        case 1: controller = ExamplesVC.selectionGroups(theme: theme)
        case 2: controller = SelectionGroupSingleVC(theme: theme)
        case 3: controller = SelectionGroupMultiVC(theme: theme)
        case 4, 5, 6, 7, 8: controller = calendarVC(atRow: row)            
        case 9: controller = FooterVC(theme: theme)
        case 10: controller = NotesVC(theme: theme)
        case 11: controller = ExamplesVC.notesViews(theme: theme)
        default: return
        }
        
        if let controller = controller {
            navigationController.pushViewController(controller, animated: true)
        } else {
            displayAlert(title: "Not Implemented", message: "TBD. Ask Jarrod.")
        }
    }
    
    private func calendarVC(atRow row: Int) -> CalendarVC? {
        let calendar = Calendar(identifier: .gregorian)
        let startDateComponent = calendar.dateComponents([.year, .month], from: Date())
        let startDate = calendar.date(from: startDateComponent)!
        let endDate = calendar.date(byAdding: .year, value: 1, to: startDate)!
        let dateRange = startDate...endDate
        let datesToStatus: [Date: [CalendarDayStatus]] = [
            calendar.date(byAdding: .day, value: 3, to: startDate)!: [.normal],
            calendar.date(byAdding: .day, value: 4, to: startDate)!: [.normal, .needsAttention],
            calendar.date(byAdding: .day, value: 5, to: startDate)!: [.normal],
            Date(): [.needsAttention]
        ]
        let highlightedDates = [
            calendar.date(byAdding: .day, value: 10, to: startDate)!,
            calendar.date(byAdding: .day, value: 18, to: startDate)!
        ]
        
        let config: HCalendarViewConfig
        switch row - 4 {
        case 0:
            config = HCalendarViewConfig(dateRange: dateRange,
                                         accessoryStyle: .multiStatus,
                                         initialDateSelection: .none,
                                         areDaysSelectable: false)
        case 1:
            config = HCalendarViewConfig(dateRange: dateRange,
                                         accessoryStyle: .none,
                                         initialDateSelection: .singleDate(nil),
                                         areDaysSelectable: true)
        case 2:
            config = HCalendarViewConfig(dateRange: dateRange,
                                         accessoryStyle: .status,
                                         initialDateSelection: .multiDate([
                                            calendar.date(byAdding: .day, value: 2, to: startDate)!,
                                            calendar.date(byAdding: .day, value: 3, to: startDate)!
                                         ]),
                                         areDaysSelectable: true)
        case 3:
            config = HCalendarViewConfig(dateRange: dateRange,
                                         accessoryStyle: .none,
                                         initialDateSelection: .singleRange(.none, (nil)),
                                         areDaysSelectable: true)
        case 4:
            config = HCalendarViewConfig(dateRange: dateRange,
                                         accessoryStyle: .none,
                                         initialDateSelection: .multiRange(.none, []),
                                         areDaysSelectable: true)
        default:
            return nil
        }
        
        return CalendarVC(theme: theme,
                          config: config,
                          datesToStatus: datesToStatus,
                          highlightedDates: highlightedDates)
    }
}
