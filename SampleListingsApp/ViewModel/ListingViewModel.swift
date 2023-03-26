//
//  ListingViewModel.swift
//  SampleListingsApp
//
//  Created by Muhammad Zulqurnain on 26/03/2023.
//

import Foundation

protocol ListViewModelProtocol {
  var listings: [Listing] { get }
  func fetchListings(completion: @escaping () -> Void)
  func likeItem(at index: Int)
}

class ListingViewModel: ListViewModelProtocol {
  var listings: [Listing]

  init() {
    self.listings = []
  }
  
  func fetchListings(completion: @escaping () -> Void) {
    NetworkManager.shared.fetchListings { [weak self] listings in
      self?.listings = listings
      completion()
    }
  }
  
  func likeItem(at index: Int) {
    listings[index].completed.toggle()
  }
}
