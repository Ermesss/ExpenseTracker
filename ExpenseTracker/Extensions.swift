//
//  Extensions.swift
//  ExpenseTracker
//
//  Created by Ermanno Fissore on 12/06/2022.
//

import Foundation
import SwiftUI

extension Color {
    static let background = Color("Background")
    static let icon = Color("Icon")
    static let text = Color ("Text")
    static let systemBackground = Color(uiColor: .systemBackground)
}

extension DateFormatter {
    static let allNumericUSA: DateFormatter = {
        print("Initialising DateFormatter")
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/dd/yyy"
        
        return formatter
    }()
}

extension String {
    func dateParsed() -> Date {
       guard let parsedDate = DateFormatter.allNumericUSA.date(from: self) else { return Date() }
            
        return parsedDate
    }
}
