//
//  Contact.swift
//  LiteJSONConvertible
//
//  Created by Andrea Prearo on 4/16/16.
//  Copyright © 2016 Andrea Prearo
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
        return Contact(
            avatar: json <| "avatar",
            firstName: json <| "firstName",
            lastName: json <| "lastName",
            company: json <| "company",
            phone: json <|| "phone" >>> Phone.decode,
            email: json <|| "email" >>> Email.decode,
            location: json <|| "location" >>> Location.decode)
    }
    
}
