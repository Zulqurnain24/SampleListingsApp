//
//  SampleListingsAppTests.swift
//  SampleListingsAppTests
//
//  Created by Muhammad Zulqurnain on 26/03/2023.
//

import XCTest
@testable import SampleListingsApp

class ListingViewModelTests: XCTestCase {
  
  var sut: ListingViewModel!
  var mockNetworkManager: MockNetworkManager!
  
  override func setUpWithError() throws {
    mockNetworkManager = MockNetworkManager()
    sut = ListingViewModel()
  }
  
  override func tearDownWithError() throws {
    sut = nil
    mockNetworkManager = nil
  }
  
  func testFetchListings() throws {
    sut.fetchListings {}
    
    XCTAssertTrue(mockNetworkManager.fetchListingsCalled)
  }
  
}
