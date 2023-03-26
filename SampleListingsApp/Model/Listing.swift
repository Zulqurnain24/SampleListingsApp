//
//  Listing.swift
//  SampleListingsApp
//
//  Created by Muhammad Zulqurnain on 26/03/2023.
//

import Foundation

struct Listing: Codable, Identifiable, Equatable {
  let id: Int
  let title: String
  var completed: Bool = false
}
