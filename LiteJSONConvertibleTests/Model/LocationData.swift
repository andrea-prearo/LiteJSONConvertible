//
//  LocationData.swift
//  LiteJSONConvertible
//
//  Created by Andrea Prearo on 4/16/16.
//  Copyright © 2016 Andrea Prearo
//

import Foundation
import LiteJSONConvertible

struct LocationData {
    
    let address: String?
    let city: String?
    let state: String?
    let country: String?
    let zipCode: String?
    
    init(address: String?,
        city: String?,
        state: String?,
        country: String?,
        zipCode: String?) {
        self.address = address
        self.city = city
        self.state = state
        self.country = country
        self.zipCode = zipCode
    }
    
}

extension LocationData: JSONDecodable {
    
    static func decode(json: JSON) -> LocationData? {
        return LocationData(
            address: json <| "address",
            city: json <| "city",
            state: json <| "state",
            country: json <| "country",
            zipCode: json <| "zipCode")
    }
    
}
