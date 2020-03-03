//
//  BookStore_CarlosNetoTests.swift
//  BookStore_CarlosNetoTests
//
//  Created by Carlos Neto on 02/03/2020.
//  Copyright © 2020 Carlos Neto. All rights reserved.
//

import XCTest
@testable import BookStore_CarlosNeto

class BookStore_CarlosNetoTests: XCTestCase {

    var session: URLSession!
    
    override func setUp() {
        super.setUp()
        session = URLSession(configuration: .default)
    }

    override func tearDown() {
        session = nil
        super.tearDown()
    }

    func testValidCallToEndpointGetsHTTPStatusCode200() {
        let url =
            URL(string: "https://www.googleapis.com/books/v1/volumes?q=ios&maxResults=9&startIndex=0")
        let promise = expectation(description: "Status code: 200")
        let dataTask = session.dataTask(with: url!) { data, response, error in
            if let error = error {
                XCTFail("Error: \(error.localizedDescription)")
                return
            } else if let statusCode = (response as? HTTPURLResponse)?.statusCode {
                if statusCode == 200 {
                    promise.fulfill()
                } else {
                    XCTFail("Status code: \(statusCode)")
                }
            }
        }
        dataTask.resume()
        wait(for: [promise], timeout: 5)
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
