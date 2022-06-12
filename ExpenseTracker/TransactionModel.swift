//
//  TransactionModel.swift
//  ExpenseTracker
//
//  Created by Ermanno Fissore on 12/06/2022.
//

import Foundation
import SwiftUIFontIcon

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
    
    var icon: FontAwesomeCode {
        if let category = Category.all.first(where: { $0.id == categoryId }) {
            return category.icon
    }
        
    return.question
        
    }
    
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

struct Category{
    let id: Int
    let name: String
    let icon: FontAwesomeCode
    var mainCategoryId: Int?
    
}

// FINISH TO ADD MORE CATEGORIES AND SUBCATEGORIES

extension Category{
    static let autoAndTransport = Category(id: 1, name: "Auto & Transport", icon: .car_alt)
    static let billsAndUtilities = Category(id: 2, name: "Bills & Utilities", icon: .file_invoice_dollar)
    static let entertainment = Category(id: 3, name: "Entertainment", icon: .film)
    static let feesAndCharges = Category(id: 4, name: "Fees & Charges", icon: .hand_holding_usd)
    static let foodAndDining = Category(id: 5, name: "Food & Dining", icon: .hamburger)
    static let home = Category(id: 6, name: "Home", icon: .home)
    static let income = Category(id: 7, name: "Income", icon: .dollar_sign)
    static let shopping = Category(id: 8, name: "Shopping", icon: .shopping_bag)
    static let transfer = Category(id: 9, name: "Transfer", icon: .exchange_alt)
    
    static let publicTransportation = Category(id: 101, name: "Public Transportation", icon: .bus, mainCategoryId: 1)
    static let taxi = Category(id: 102, name: "Taxi", icon: .taxi, mainCategoryId: 2)
    static let mobilePhone = Category(id: 103, name: "Mobile Phone", icon: .phone, mainCategoryId: 3)
    static let moviesAndDVDs = Category(id: 104, name: "Movies & DVDs", icon: .film, mainCategoryId: 4)
    static let bankFee = Category(id: 105, name: "Bank Fee", icon: .bus, mainCategoryId: 5)
    static let financeCharge = Category(id: 106, name: "Finance Charge", icon: .bus, mainCategoryId: 6)
    static let groceries = Category(id: 107, name: "Groceries", icon: .bus, mainCategoryId: 7)
    static let restaurants = Category(id: 108, name: "Restaurants", icon: .bus, mainCategoryId: 8)
    static let rent = Category(id: 109, name: "Rent", icon: .bus, mainCategoryId: 9)
    static let homeSupplies = Category(id: 110, name: "Home Suplies", icon: .bus, mainCategoryId: 10)
    static let paycheque = Category(id: 111, name: "Paycheque", icon: .bus, mainCategoryId: 11)
    static let software = Category(id: 112, name: "Software", icon: .bus, mainCategoryId: 12)
    static let creditCardPayment = Category(id: 113, name: "Credit Card Payment", icon: .bus, mainCategoryId: 13)
}

extension Category {
    static let categories: [Category] = [
        .autoAndTransport,
        .billsAndUtilities,
        .entertainment,
        .feesAndCharges,
        .foodAndDining,
        .home,
        .income,
        .shopping,
        .transfer
    ]
    
    static let subcategories: [Category] = [
        .publicTransportation,
        .taxi,
        .mobilePhone,
        .moviesAndDVDs,
        .bankFee,
        .financeCharge,
        .groceries,
        .restaurants,
        .rent,
        .homeSupplies,
        .paycheque,
        .software,
        .creditCardPayment
    ]
    
    static let all: [Category] = categories + subcategories
}
