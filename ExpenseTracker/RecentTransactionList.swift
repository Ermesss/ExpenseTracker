//
//  RecentTransactionList.swift
//  ExpenseTracker
//
//  Created by Ermanno Fissore on 12/06/2022.
//

import SwiftUI

struct RecentTransactionList: View {
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
    }
        .padding()
        .background(Color.systemBackground)
        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
        .shadow(color: Color.primary.opacity(0.2), radius: 10, x: 0, y: 5)
}

struct RecentTransactionList_Previews: PreviewProvider {
    static var previews: some View {
        RecentTransactionList()
        }
    }
}
