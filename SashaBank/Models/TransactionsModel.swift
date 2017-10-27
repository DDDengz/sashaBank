//
//  TransactionsModel.swift
//  SashaBank
//
//  Created by Alex Dearden on 24/10/2017.
//  Copyright © 2017 Alex Dearden. All rights reserved.
//

import Foundation

// Note: the only reason this class is an NSObject is to add it as object to the Storyboard.
// I'm not saying this is best practice, but it's certainly interesting to see the model in Storyboard at a glance
final class TransactionsModel: NSObject {
    
    private var account: Account?
    var transactions: [Transaction] = []
    
    override init() {
        super.init()
        self.createTransactions()
    }
    
    func createTransactions() {
        let mockUrl = "" // mockUrl so as not to disrupt the loadData() method which needs to take an endpoint.
        
        RemoteServices.loadData(urlString: mockUrl) { json in
            self.account = Account(json: json)
            
            guard let jsonItems = json["Items"].array else {
                return
            }
            self.transactions = jsonItems.flatMap { jsonItem -> Transaction? in
                Transaction(jsonItem: jsonItem)
            }
        }
    }
    
    func balanceLabel() -> String {
        guard let balance = self.account?.balance else {
            return ""
        }
        return balance.formatAsCurrency()
    }
    
    func transactionLabel(for indexpath: IndexPath) -> String {
        return self.transactions[indexpath.row].senderDisplayName
    }
    
    func dateLabel(for indexpath: IndexPath) -> String {
        return self.transactions[indexpath.row].date.toString()
    }
    
    func amountLabel(for indexpath: IndexPath) -> String {
        return self.transactions[indexpath.row].amount.formatAsCurrency()
    }
}
