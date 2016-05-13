//
//  Phone.swift
//  LiteJSONConvertible
//
//  Created by Prearo, Andrea on 4/16/16.
//
//

import Foundation
import LiteJSONConvertible

struct Phone {
    
    let label: String?
    let number: String?
    
    init(label: String?,
        number: String?) {
        self.label = label
        self.number = number
    }
    
}

extension Phone: JSONDecodable {
    
    static func decode(json: JSON) -> Phone? {
        let label = parseString(json, key: "label")
        let number = parseString(json, key: "number")
        return Phone(label: label,
            number: number)
    }
    
}
