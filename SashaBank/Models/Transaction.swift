//
//  Transaction.swift
//  SashaBank
//
//  Created by Alex Dearden on 24/10/2017.
//  Copyright © 2017 Alex Dearden. All rights reserved.
//

import Foundation
import SwiftyJSON

struct Account {
    let name: String
    var balance: Double
    
    init(json: JSON) {
        self.name = "Test Account"
        self.balance = json["CurrentBalance"].doubleValue
    }
}

struct Transaction {
    var status: Status
    let transactionId: Int
    let date: Date
    let reference: String
    let currencyCode: CurrencyCode
    let amount: Double
    let senderDisplayName: String
    let senderInitials: String
    let senderAccountNumber: String
    let receiverDisplayName: String
    let receiverInitials: String
    let receiverAccountNumber: String
    
    init(jsonItem: JSON) {
        self.transactionId = jsonItem["TransactionId"].intValue
        self.senderDisplayName = jsonItem["SenderDisplayName"].stringValue
        self.status = Status.init(fromString: jsonItem["Status"].stringValue.lowercased()) ?? .failed
        self.amount = jsonItem["Amount"].doubleValue
        
        date = jsonItem["Date"].stringValue.toDate()
        
        reference = jsonItem["Reference"].stringValue
        currencyCode = CurrencyCode.init(fromString: jsonItem["CurrencyCode"].stringValue) ?? .eur
        senderInitials = jsonItem["ReceiverInitials"].stringValue
        senderAccountNumber = jsonItem["SenderAccountNumber"].stringValue
        receiverDisplayName = jsonItem["ReceiverDisplayName"].stringValue
        receiverInitials = jsonItem["ReceiverInitials"].stringValue
        receiverAccountNumber = jsonItem["ReceiverAccountNumber"].stringValue
    }
}

