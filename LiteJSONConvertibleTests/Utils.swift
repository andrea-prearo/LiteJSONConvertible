//
//  Utils.swift
//  LiteJSONConvertible
//
//  Created by Prearo, Andrea on 4/5/16.
//
//

import Foundation
import LiteJSONConvertible
import XCTest

class Utils {
    
    class func loadJsonFrom(baseFileName: String) throws -> AnyObject? {
        var responseDict: AnyObject?
        if let fileURL = NSBundle(forClass: self).URLForResource(baseFileName, withExtension: "json") {
            if let jsonData = NSData(contentsOfURL: fileURL) {
                responseDict = try! NSJSONSerialization.JSONObjectWithData(jsonData, options: .AllowFragments)
            }
        }
        return responseDict
    }
    
    class func loadJsonData(data: NSData) throws -> AnyObject? {
        return try! NSJSONSerialization.JSONObjectWithData(data, options: .AllowFragments)
    }
    
    class func comparePhone(phones: [Phone?]?, json: [JSON]?) {
        if let phones = phones,
            json = json {
                for (var i=0; i < phones.count; i++) {
                    let json = json[i]
                    if let phone = phones[i] {
                        if let label = phone.label {
                            XCTAssertEqual(label, json["label"])
                        } else {
                            XCTAssertNil(json["label"])
                        }
                        if let number = phone.number {
                            XCTAssertEqual(number, json["number"])
                        } else {
                            XCTAssertNil(json["number"])
                        }
                    } else {
                        XCTFail("Phone comparison failed")
                    }
                }
        } else {
            XCTFail("Phone parsing failed")
        }
    }
    
    class func compareEmail(emails: [Email?]?, json: [JSON]?) {
        if let emails = emails,
            json = json {
                for (var i=0; i < emails.count; i++) {
                    let json = json[i]
                    if let email = emails[i] {
                        if let label = email.label {
                            XCTAssertEqual(label, json["label"])
                        } else {
                            XCTAssertNil(json["label"])
                        }
                        if let address = email.address {
                            XCTAssertEqual(address, json["address"])
                        } else {
                            XCTAssertNil(json["address"])
                        }
                    } else {
                        XCTFail("Email comparison failed")
                    }
                }
        } else {
            XCTFail("Email parsing failed")
        }
    }
    
    class func compareLocation(locations: [Location?]?, json: [JSON]?) {
        if let locations = locations,
            json = json {
                for (var i=0; i < locations.count; i++) {
                    let json = json[i]
                    if let location = locations[i] {
                        if let label = location.label {
                            XCTAssertEqual(label, json["label"])
                        } else {
                            XCTAssertNil(json["label"])
                        }
                        compareLocationData(location.data!, json: json["data"])
                    } else {
                        XCTFail("Location comparison failed")
                    }
                }
        } else {
            XCTFail("Location parsing failed")
        }
    }
    
    class func compareLocationData(locationData: LocationData?, json: JSON?) {
        if let locationData = locationData,
            json = json {
                if let address = locationData.address {
                    XCTAssertEqual(address, json["address"])
                } else {
                    XCTAssertNil(json["address"])
                }
                if let city = locationData.city {
                    XCTAssertEqual(city, json["city"])
                } else {
                    XCTAssertNil(json["city"])
                }
                if let state = locationData.state {
                    XCTAssertEqual(state, json["state"])
                } else {
                    XCTAssertNil(json["state"])
                }
                if let country = locationData.country {
                    XCTAssertEqual(country, json["country"])
                } else {
                    XCTAssertNil(json["country"])
                }
        } else {
            XCTFail("LocationData comparison failed")
        }
    }
    
}
