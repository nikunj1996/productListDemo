//
//  PLApiHandler_Test.swift
//  ProductListDemoTests
//
//  Created by Nikunj Ladani on 29/12/22.
//

import XCTest
@testable import ProductListDemo

final class PLApiHandler_Test: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_PLApiHandler_productData_shouldBeEmpty() throws {
        let apiHandler = PLApiHandler()
        XCTAssert(apiHandler.productData.isEmpty)
    }

    func test_PLApiHandler_fetchProducts_shouldNotBeEmpty() throws {
        let apiHandler = PLApiHandler()
        let expectation = XCTestExpectation()
        var productsList: [ProductModel] = []
        apiHandler.fetchProducts { products, error in
            productsList = products
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 5)
        XCTAssert(!productsList.isEmpty)
    }
}
