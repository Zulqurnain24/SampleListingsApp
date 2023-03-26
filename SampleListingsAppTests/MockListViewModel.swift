//
//  MockListViewModel.swift
//  SampleListingsAppTests
//
//  Created by Muhammad Zulqurnain on 26/03/2023.
//

@testable import SampleListingsApp

class MockListViewModel: ListViewModelProtocol {
  var listings: [Listing] = [Listing]()
  var didSelectListingCalled = false
  var selectedListing: Listing?
  
  func fetchListings() {
    listings = [Listing(id: 1, title: "Listing 1", completed: false)]
  }
  
  func selectListing(_ listing: Listing) {
    didSelectListingCalled = true
    selectedListing = listing
  }
  
  func fetchListings(completion: @escaping () -> Void) {}
  
  func likeItem(at index: Int) {}
}
