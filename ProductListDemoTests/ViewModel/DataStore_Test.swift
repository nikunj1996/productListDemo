//
//  DataStore_Test.swift
//  ProductListDemoTests
//
//  Created by Nikunj Ladani on 29/12/22.
//

import XCTest
@testable import ProductListDemo

final class DataStore_Test: XCTestCase {
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func test_DataStore_favId_shouldBeEmpty() throws {
        let store = DataStore()
        XCTAssert(store.favId.isEmpty)
    }
    
    func test_DataStore_onFavClick_shouldAddNewFavItem() throws{
        let store = DataStore()
        let id = UUID().uuidString
        store.onFavClick(id: id)
        XCTAssert(store.favId.contains(id))
    }
    
    func test_DataStore_onFavClick_shouldRemoveExitingItem() throws{
        let store = DataStore()
        let id = UUID().uuidString
        store.onFavClick(id: id)
        // Second click for removing id
        store.onFavClick(id: id)
        XCTAssert(!store.favId.contains(id))
    }
}
