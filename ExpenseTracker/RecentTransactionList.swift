//
//  RecentTransactionList.swift
//  ExpenseTracker
//
//  Created by Ermanno Fissore on 12/06/2022.
//

import SwiftUI

struct RecentTransactionList: View {
    @EnvironmentObject var transactionListVM: TransactionListViewModel
    
    var body: some View {
        VStack{
            HStack{
//                HEADER TITLE
                Text("Recent transcations")
                    .bold()
                
                Spacer()
                
//                HEADER LINK
                NavigationLink{
                    
                } label: {
                    HStack (spacing: 4){
                    Text("See All")
                    Image(systemName: "chevron.right")
                }
                .foregroundColor(Color.text)
            }
        }
            .padding(.top)
            
//            RECENT TRANSACTION LIST
            ForEach (Array(transactionListVM.transaction.prefix(5).enumerated()), id: \.element)
            {index, transaction in
                TransactionRow(transaction: transaction)
                
                Divider()
                    .opacity(index == 4 ? 0 : 1)
            }
    }
        .padding()
        .background(Color.systemBackground)
        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
        .shadow(color: Color.primary.opacity(0.2), radius: 10, x: 0, y: 5)
}

struct RecentTransactionList_Previews: PreviewProvider {
    static let transactionListVM: TransactionListViewModel = {
        let transactionListVM = TransactionListViewModel()
        transactionListVM.transaction = transactionListPreviewData
        return transactionListVM
    }()
    
    static var previews: some View {
        Group {
            RecentTransactionList()
            RecentTransactionList()
                .preferredColorScheme(.dark)
        }
        .environmentObject(transactionListVM)

        }
    }
}
