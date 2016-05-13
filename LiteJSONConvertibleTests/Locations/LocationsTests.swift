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

class LocationsTests: XCTestCase {

    func testParsing() {
        do {
            guard let json = try Utils.loadJsonFrom("Locations") as? JSON else {
                XCTFail("JSON loading failed")
                return
            }
            let locationsJson = json["locations"] as? [JSON]
            let locations = locationsJson.map({
                return Location.decode($0)
            })
            XCTAssertEqual(locations!.count, 2)
            Utils.compareLocation(locations, json: json["locations"] as? [JSON])
        } catch let error as NSError {
            XCTFail(error.localizedDescription)
        }
    }

}
