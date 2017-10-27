//
//  Enums.swift
//  SashaBank
//
//  Created by Alex Dearden on 27/10/2017.
//  Copyright © 2017 Alex Dearden. All rights reserved.
//

import Foundation

// TODO: Add more currencies
enum CurrencyCode: String {
    case eur
    case usd
    case gbp
    
    // Note: Xcode 9 will throw an ambigous init error if the enum declaration is in a different file...
    //... when initialising from rawValue, this is a workaround.
    init?(fromString: String) {
        self.init(rawValue: fromString)
    }
}

enum Status: String {
    case completed
    case failed
    case authorised
    case pending
    
    init?(fromString: String) {
        self.init(rawValue: fromString)
    }
}
