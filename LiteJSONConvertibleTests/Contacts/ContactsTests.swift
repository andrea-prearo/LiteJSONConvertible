//
//  ContactsTests.swift
//  LiteJSONConvertible
//
//  Created by Prearo, Andrea on 4/5/16.
//
//

import Foundation
import XCTest
import LiteJSONConvertible

class ContactsTests: XCTestCase {
    
    func testParsing() {
        do {
            guard let json = try Utils.loadJsonFrom("Contacts") as? [JSON] else {
                XCTFail("JSON loading failed")
                return
            }
            let contacts = json.map(Contact.decode)
            XCTAssertEqual(contacts.count, json.count)
            for (var i=0; i < contacts.count; i++) {
                let json = json[i]
                if let contact = contacts[i] {
                    if let avatar = contact.avatar {
                        XCTAssertEqual(avatar, json["avatar"])
                    } else {
                        XCTAssertNil(json["avatar"])
                    }
                    if let firstName = contact.firstName {
                        XCTAssertEqual(firstName, json["firstName"])
                    } else {
                        XCTAssertNil(json["firstName"])
                    }
                    if let lastName = contact.lastName {
                        XCTAssertEqual(lastName, json["lastName"])
                    } else {
                        XCTAssertNil(json["lastName"])
                    }
                    if let company = contact.company {
                        XCTAssertEqual(company, json["company"])
                    } else {
                        XCTAssertNil(json["company"])
                    }
                    Utils.compareLocation(contact.location, json: json["location"] >>> JSONArray)
                    Utils.comparePhone(contact.phone, json: json["phone"] >>> JSONArray)
                    Utils.compareEmail(contact.email, json: json["email"] >>> JSONArray)
                } else {
                    XCTFail("Parsing failed")
                }
            }
        } catch let error as NSError {
            XCTFail(error.localizedDescription)
        }
    }
    
}
