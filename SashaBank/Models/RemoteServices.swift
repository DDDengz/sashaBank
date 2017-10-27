//
//  RemoteServices.swift
//  SashaBank
//
//  Created by Alex Dearden on 24/10/2017.
//  Copyright © 2017 Alex Dearden. All rights reserved.
//

import Foundation
import SwiftyJSON

typealias TransactionsCompletion = (_ json: JSON) -> Void

final class RemoteServices: NSObject {
    
    // NOTE: If getting data remotely, we would pass the urlString. Leaving it for future enhancement.
    class func loadData(urlString: String, completion: @escaping TransactionsCompletion) {

        let path = Bundle.main.path(forResource: "1", ofType: "json")!
        let jsonString = try? String(contentsOfFile: path, encoding: String.Encoding.utf8)
        let json = JSON(parseJSON: jsonString!)
        
        completion(json)
    }
}

