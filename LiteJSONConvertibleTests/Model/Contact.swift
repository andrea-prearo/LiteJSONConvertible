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
        return Contact(
            avatar: json["avatar"] >>> JSONParse,
            firstName: json["firstName"] >>> JSONParse,
            lastName: json["lastName"] >>> JSONParse,
            company: json["company"] >>> JSONParse,
            phone: json["phone"] >>> JSONArray >>> Phone.decode,
            email: json["email"] >>> JSONArray >>> Email.decode,
            location: json["location"] >>> JSONArray >>> Location.decode)
    }
    
}
