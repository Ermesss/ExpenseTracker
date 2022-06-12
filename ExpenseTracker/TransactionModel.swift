//
//  TransactionModel.swift
//  ExpenseTracker
//
//  Created by Ermanno Fissore on 12/06/2022.
//

import Foundation

struct Transaction: Identifiable, Decodable, Hashable {
    let id: Int
    let date: String
    let institution: String
    let account: String
    var merchant: String
    let amount: Double
    let type: TransactionType.RawValue
    var categoryId: Int
    var category: String
    let isPending: Bool
    var isExpense: Bool
    var isEdited:Bool
    
    var dateParsed: Date{
        date.dateParsed()
    }
    
    var signedAmount: Double{
        return type == TransactionType.credit.rawValue ? amount : -amount
    }
}

//LET are read only
//VAR are editable

enum TransactionType: String {
    case debit = "debit"
    case credit = "credit"
}
