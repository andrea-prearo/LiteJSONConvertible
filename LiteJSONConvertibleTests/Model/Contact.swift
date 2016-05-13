//
//  Contact.swift
//  LiteJSONConvertible
//
//  Created by Prearo, Andrea on 4/16/16.
//
//

import Foundation
import LiteJSONConvertible

struct Contact {
    
    let avatar: String?
    let firstName: String?
    let lastName: String?
    let company: String?
    let phone: [Phone?]?
    let email: [Email?]?
    let location: [Location?]?
    
    init(avatar: String?,
        firstName: String?,
        lastName: String?,
        company: String?,
        phone: [Phone?]?,
        email: [Email?]?,
        location: [Location?]?) {
        self.avatar = avatar
        self.firstName = firstName
        self.lastName = lastName
        self.company = company
        self.phone = phone
        self.email = email
        self.location = location
    }
    
}

extension Contact: JSONDecodable {
    
    static func decode(json: JSON) -> Contact? {
        let avatar = parseString(json, key: "avatar")
        let firstName = parseString(json, key: "firstName")
        let lastName = parseString(json, key: "lastName")
        let company = parseString(json, key: "company")
        let phone = Phone.decode(json["phone"] as? [JSON])
        let email = Email.decode(json["email"] as? [JSON])
        let location = Location.decode(json["location"] as? [JSON])
        return Contact(avatar: avatar,
            firstName: firstName,
            lastName: lastName,
            company: company,
            phone: phone,
            email: email,
            location: location)
    }
    
}
