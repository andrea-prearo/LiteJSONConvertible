//
//  Email.swift
//  LiteJSONConvertible
//
//  Created by Andrea Prearo on 4/5/16.
//  Copyright © 2016 Andrea Prearo
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
        return Email(
            label: json <| "label",
            address: json <| "address")
    }
    
}
