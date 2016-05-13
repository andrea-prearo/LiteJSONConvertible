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
        return Phone(
            label: json <| "label",
            number: json <| "number")
    }
    
}
