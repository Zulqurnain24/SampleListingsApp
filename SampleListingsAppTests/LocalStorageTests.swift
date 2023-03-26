//
//  LocalStorageTests.swift
//  SampleListingsAppTests
//
//  Created by Muhammad Zulqurnain on 26/03/2023.
//

// LocalStorageTests.swift

import XCTest
@testable import SampleListingsApp

class LocalStorageTests: XCTestCase {
  
  var sut: LocalStorage!
  
  override func setUpWithError() throws {
    sut = LocalStorage()
  }
  
  override func tearDownWithError() throws {
    sut = nil
  }
  
  func testLikeListing() throws {
    let listing = Listing(id: 1, title: "Listing 1", completed: false)
    sut.likeListing(listing)
    
    XCTAssertTrue(sut.isListingLiked(listing))
  }

  func testUnlikeListing() throws {
    let listing = Listing(id: 1, title: "Listing 1", completed: false)
    sut.unlikeListing(listing)
    
    XCTAssertFalse(sut.isListingLiked(listing))
  }
}
