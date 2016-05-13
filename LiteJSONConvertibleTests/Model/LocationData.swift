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
        let address = parseString(json, key: "address")
        let city = parseString(json, key: "city")
        let state = parseString(json, key: "state")
        let country = parseString(json, key: "country")
        let zipCode = parseString(json, key: "zipCode")
        return LocationData(address: address,
            city: city,
            state: state,
            country: country,
            zipCode: zipCode)
    }
    
}
