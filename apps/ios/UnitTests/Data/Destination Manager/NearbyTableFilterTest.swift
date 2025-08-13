//
//  NearbyTableFilterTest.swift
//  UnitTests
//
//  Created by Jonathan Ha on 7/11/24.
//  Copyright © 2024 Soundscape community. All rights reserved.
//

import XCTest
@testable import Soundscape

final class NearbyTableFilterTest: XCTestCase {

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    override func tearDownWithError() throws {
    }

    func testDefaultFilter() throws {
        let filter = NearbyTableFilter.defaultFilter
        XCTAssertNil(filter.type)
        XCTAssertEqual(filter.localizedString, GDLocalizedString("filter.all"))
        XCTAssertEqual(filter.image, UIImage(named: "AllPlaces"))
    }
    
    func testPrimaryTypeFilters() throws {
        let filters = NearbyTableFilter.primaryTypeFilters
        XCTAssertEqual(filters.count, PrimaryType.allCases.count + 1) // +1 for the default filter
        
        for (index, type) in PrimaryType.allCases.enumerated() {
            let filter = filters[index + 1] // First filter is the default filter
            XCTAssertEqual(filter.type, type)
            switch type {
            case .transit:
                XCTAssertEqual(filter.localizedString, GDLocalizedString("filter.transit"))
                XCTAssertEqual(filter.image, UIImage(named: "Transit"))
            case .food:
                XCTAssertEqual(filter.localizedString, GDLocalizedString("filter.food_drink"))
                XCTAssertEqual(filter.image, UIImage(named: "Food & Drink"))
            case .park:
                XCTAssertEqual(filter.localizedString, GDLocalizedString("filter.parks"))
                XCTAssertEqual(filter.image, UIImage(named: "Parks"))
            case .bank:
                XCTAssertEqual(filter.localizedString, GDLocalizedString("filter.banks"))
                XCTAssertEqual(filter.image, UIImage(named: "Banks & ATMs"))
            case .grocery:
                XCTAssertEqual(filter.localizedString, GDLocalizedString("filter.groceries"))
                XCTAssertEqual(filter.image, UIImage(named: "Groceries & Convenience Stores "))
            case .navilens:
                XCTAssertEqual(filter.localizedString, GDLocalizedString("filter.navilens"))
                XCTAssertEqual(filter.image, UIImage(named: "navilens"))
            }
        }
    }

    func testEquality() throws {
        let filter1 = NearbyTableFilter(type: .transit)
        let filter2 = NearbyTableFilter(type: .transit)
        let filter3 = NearbyTableFilter(type: .food)
        
        XCTAssertEqual(filter1, filter2)
        XCTAssertNotEqual(filter1, filter3)
    }
}
