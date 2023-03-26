//
//  MockNetworkManager.swift
//  SampleListingsAppTests
//
//  Created by Muhammad Zulqurnain on 26/03/2023.
//

@testable import SampleListingsApp

import Foundation

class MockNetworkManager: NetworkManagerProtocol {

    var fetchListingsCalled = false

    func fetchListings(completion: @escaping ([Listing]) -> Void) {
        fetchListingsCalled = true
        completion([Listing(id: 1, title: "Listing 1", completed: false)])
    }

}
