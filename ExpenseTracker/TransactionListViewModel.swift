//
//  TransactionListViewModel.swift
//  ExpenseTracker
//
//  Created by Ermanno Fissore on 12/06/2022.
//

import Foundation
import Combine

final class TransactionListViewModel: ObservableObject{
    @Published var transaction: [Transaction] = []
    
    private var cancellable = Set<AnyCancellable>()
    
    init() {
        getTransactions()
    }
    
    func getTransactions(){
        guard let url = URL(string: "https://designcode.io/data/transaction.json") else {
            print("Invalid URL")
            return
        }
        URLSession.shared.dataTaskPublisher(for: url)
            .tryMap {(data, response) -> Data in
                guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                    dump(response)
                    throw URLError(.badServerResponse)
                }
                return data
            }
            .decode(type: [Transaction].self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                case .failure(let error):
                    print("Error fetching transaction:", error.localizedDescription)
                case .finished:
                    print("Finished fetching transactions")
                }
            } receiveValue: { [weak self] result in
                self?.transaction = result
            }
            .store(in: &cancellable)

    }
}
