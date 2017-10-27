//
//  Extensions.swift
//  SashaBank
//
//  Created by Alex Dearden on 27/10/2017.
//  Copyright © 2017 Alex Dearden. All rights reserved.
//

import Foundation

extension String {
    func toDate() -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSXXXXX"
        dateFormatter.timeZone = NSTimeZone.local
        let date = dateFormatter.date(from: self)
        return date ?? Date(timeIntervalSince1970: 0)
    }
}

extension Date {
    func toString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        
        return dateFormatter.string(from: self)
    }
}

extension Double {
    func formatAsCurrency() -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        
        let formattedValue = formatter.string(from: self as NSNumber)
        return formattedValue ?? String(self)
    }
}
