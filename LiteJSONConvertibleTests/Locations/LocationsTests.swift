//
//  ContactsTests.swift
//  LiteJSONConvertible
//
//  Created by Andrea Prearo on 4/5/16.
//  Copyright © 2016 Andrea Prearo
//

import Foundation
import XCTest
import LiteJSONConvertible

class LocationsTests: XCTestCase {

    func testParsing() {
        do {
            guard let json = try Utils.loadJsonFrom("Locations") else {
                XCTFail("JSON loading failed")
                return
            }
            let locations = json <|| "locations" >>> Location.decode
            XCTAssertEqual(locations!.count, 2)
            Utils.compareLocation(locations, json: json <|| "locations")
        } catch let error as NSError {
            XCTFail(error.localizedDescription)
        }
    }

}
