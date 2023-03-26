//
//  LocalStorage.swift
//  SampleListingsApp
//
//  Created by Muhammad Zulqurnain on 26/03/2023.
//

import Foundation

class LocalStorage {
    static let shared = LocalStorage()

    private let userDefaults = UserDefaults.standard
    private let likedListingsKey = "likedListings"

    init() {}

    func isListingLiked(_ listing: Listing) -> Bool {
        let likedListings = getLikedListings()
        return likedListings.contains(listing.id)
    }

    func likeListing(_ listing: Listing) {
        var likedListings = getLikedListings()
        likedListings.append(listing.id)
        saveLikedListings(likedListings)
    }

    func unlikeListing(_ listing: Listing) {
        var likedListings = getLikedListings()
        if let index = likedListings.firstIndex(of: listing.id) {
            likedListings.remove(at: index)
            saveLikedListings(likedListings)
        }
    }

    func getLikedListings() -> [Int] {
        return userDefaults.array(forKey: likedListingsKey) as? [Int] ?? []
    }

    func saveLikedListings(_ likedListings: [Int]) {
        userDefaults.set(likedListings, forKey: likedListingsKey)
    }
}
