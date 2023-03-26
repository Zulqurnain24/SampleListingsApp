//
//  MockLocalStorage.swift
//  SampleListingsAppTests
//
//  Created by Muhammad Zulqurnain on 26/03/2023.
//

import XCTest
@testable import SampleListingsApp

class MockLocalStorage: LocalStorage {
  
  var mockUnlikeListingCalled: Bool?
  var likedListings: [Listing]
  var mockLikedListings: [Listing] = []
  
  init(likedListings: [Listing] = []) {
    self.likedListings = likedListings
  }
  
  override func isListingLiked(_ listing: Listing) -> Bool {
    return !likedListings.map({ $0.id == listing.id }).isEmpty
  }
  
  override func likeListing(_ listing: Listing) {
    likedListings.append(listing)
  }
  
  override func unlikeListing(_ listing: Listing) {
    mockUnlikeListingCalled = true
    mockLikedListings.removeAll(where: { $0.id == listing.id })
  }
}
