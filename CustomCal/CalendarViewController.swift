//
//  CalendarViewController.swift
//  CustomCal
//
//  Created by Esther on 7/25/23.
//

import UIKit
import HorizonCalendar

class CalendarViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createCal()
    }
    
    private func createCal() {
        //      let cal = UICalendarView() // the apple version instead of the HorizonCalendar
        let calendar = Calendar.current
        let startDate = calendar.date(from: DateComponents(year: 2020, month: 1, day: 1))!
        
        // We want our end date to be the current date, not set date
        let endDate = calendar.date(from: DateComponents(year: 2023, month: 12, day: 31))!
        let content = CalendarViewContent(calendar: calendar, visibleDateRange: startDate...endDate, monthsLayout: .vertical(options: VerticalMonthsLayoutOptions()))
        let calView = CalendarView(initialContent: content)
        
        calView.daySelectionHandler = { day in
            let output = "Selected: "+String(describing: day.components)
            print(output)
        }
        
        calView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(calView)
        
        NSLayoutConstraint.activate([
            calView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            calView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            calView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            calView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor)
        ]
        )
    }
    
}
/*
 
 */
