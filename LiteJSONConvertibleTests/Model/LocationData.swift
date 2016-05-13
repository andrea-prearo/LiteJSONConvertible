//
//  LocationData.swift
//  LiteJSONConvertible
//
//  Created by Prearo, Andrea on 4/16/16.
//
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
            address: json["address"] >>> JSONParse,
            city: json["city"] >>> JSONParse,
            state: json["state"] >>> JSONParse,
            country: json["country"] >>> JSONParse,
            zipCode: json["zipCode"] >>> JSONParse)
    }
    
}
