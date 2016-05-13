//
//  Email.swift
//  LiteJSONConvertible
//
//  Created by Prearo, Andrea on 4/5/16.
//
//

import Foundation
import LiteJSONConvertible

struct Email {
    
    let label: String?
    let address: String?
    
    init(label: String?,
        address: String?) {
        self.label = label
        self.address = address
    }
    
}

extension Email: JSONDecodable {
    
    static func decode(json: JSON) -> Email? {
        let label = parseString(json, key: "label")
        let address = parseString(json, key: "address")
        return Email(label: label,
            address: address)
    }
    
}
