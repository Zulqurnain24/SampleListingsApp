//
//  DetailViewModel.swift
//  SampleListingsApp
//
//  Created by Muhammad Zulqurnain on 26/03/2023.
//

import UIKit

class DetailViewModel {
  let item: Listing
  private let storage: LocalStorage
  
  init(item: Listing, storage: LocalStorage = LocalStorage.shared) {
    self.item = item
    self.storage = storage
  }
  
  var title: String {
    return item.title
  }
  
  var description: String {
    return item.title
  }
  
  var image: UIImage {
      get async {
          do {
              return try await mockImage()
          } catch {
              print("Error fetching image: \(error)")
              return UIImage()
          }
      }
  }
  
  var isLiked: Bool {
    get {
      return storage.isListingLiked(item)
    }
    set {
      if newValue {
        storage.likeListing(item)
      } else {
        storage.unlikeListing(item)
      }
    }
  }
  
  var likeButtonTitle: String {
    return isLiked ? "Unlike" : "Like"
  }
  
  var likeButtonColor: UIColor {
    return isLiked ? .red : .blue
  }
  
  func toggleLike() {
    isLiked.toggle()
  }
  
  func mockImage() async throws -> UIImage {
    if let url = URL(string: "https://images.unsplash.com/photo-1579353977828-2a4eab540b9a?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8c2FtcGxlfGVufDB8fDB8fA%3D%3D&w=1000&q=80"),
       let data = try? Data(contentsOf: url) {
      return UIImage(data: data) ?? UIImage()
    }
    return UIImage()
  }
}
