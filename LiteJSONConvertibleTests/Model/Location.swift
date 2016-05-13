//
//  Location.swift
//  LiteJSONConvertible
//
//  Created by Prearo, Andrea on 4/16/16.
//
//

import Foundation
import LiteJSONConvertible

struct Location {
    
    let label: String?
    let data: LocationData?
    
    init(label: String?,
        data: LocationData?) {
        self.label = label
        self.data = data
    }
    
}

extension Location: JSONDecodable {
    
    static func decode(json: JSON) -> Location? {
        return Location(
            label: json <| "label",
            data: json <| "data" >>> LocationData.decode)
    }
    
}
