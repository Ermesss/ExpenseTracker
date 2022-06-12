//
//  ExpenseTrackerApp.swift
//  ExpenseTracker
//
//  Created by Ermanno Fissore on 12/06/2022.
//

import SwiftUI

@main
struct ExpenseTrackerApp: App {
    @StateObject var transactionListVM = TransactionListViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(transactionListVM)
        }
    }
}
