//
//  PreviewDate.swift
//  ExpenseTracker
//
//  Created by Ermanno Fissore on 12/06/2022.
//

import Foundation
import SwiftUI

var transactionPreviewData = Transaction(id: 1, date: "01/24/2022", institution: "Desjardin", account: "Visa Desjardin", merchant: "Apple", amount: 11.49, type: "debit", categoryId: 801, category: "Software", isPending: false, isExpense: true, isEdited: false)

var transactionListPreviewData = [Transaction] (repeating: transactionPreviewData, count: 10)

