//
//  DetailViewModelTests.swift
//  SampleListingsAppTests
//
//  Created by Muhammad Zulqurnain on 26/03/2023.
//

// DetailViewModelTests.swift

import XCTest
@testable import SampleListingsApp

class DetailViewModelTests: XCTestCase {
  
  func testTitle() {
      // Given
      let item = Listing(id: 1, title: "Test listing", completed: false)
      let viewModel = DetailViewModel(item: item)
      
      // When
      let title = viewModel.title
      
      // Then
      XCTAssertEqual(title, "Test listing")
  }
  
  func testDescription() {
      // Given
      let item = Listing(id: 1, title: "Test listing", completed: false)
      let viewModel = DetailViewModel(item: item)
      
      // When
      let description = viewModel.description
      
      // Then
      XCTAssertEqual(description, "Test listing")
  }
  
  func testLikeButtonTitleWhenNotLiked() {
      // Given
      let item = Listing(id: 1, title: "Test listing", completed: false)
      let storage = MockLocalStorage()
      let viewModel = DetailViewModel(item: item, storage: storage)
      
      // When
      let title = viewModel.likeButtonTitle
      
      // Then
      XCTAssertEqual(title, "Like")
  }
  
  func testLikeButtonTitleWhenLiked() {
      // Given
      let item = Listing(id: 1, title: "Test listing", completed: false)
      let storage = MockLocalStorage(likedListings: [item])
      let viewModel = DetailViewModel(item: item, storage: storage)
      
      // When
      let title = viewModel.likeButtonTitle
      
      // Then
      XCTAssertEqual(title, "Unlike")
  }
  
  func testLikeButtonColorWhenNotLiked() {
      // Given
      let item = Listing(id: 1, title: "Test listing", completed: false)
      let storage = MockLocalStorage()
      let viewModel = DetailViewModel(item: item, storage: storage)
      
      // When
      let color = viewModel.likeButtonColor
      
      // Then
      XCTAssertEqual(color, .blue)
  }
  
  func testLikeButtonColorWhenLiked() {
      // Given
      let item = Listing(id: 1, title: "Test listing", completed: false)
      let storage = MockLocalStorage(likedListings: [item])
      let viewModel = DetailViewModel(item: item, storage: storage)
      
      // When
      let color = viewModel.likeButtonColor
      
      // Then
      XCTAssertEqual(color, .red)
  }
  
  func testToggleLike() {
      // Given
      let item = Listing(id: 1, title: "Test listing", completed: false)
      let storage = MockLocalStorage()
      let viewModel = DetailViewModel(item: item, storage: storage)
      
      // When
      viewModel.toggleLike()
      
      // Then
      XCTAssertTrue(storage.isListingLiked(item))
  }
  
  func testImage() async {
      // Given
      let item = Listing(id: 1, title: "Test listing", completed: false)
      let viewModel = DetailViewModel(item: item)
      
      // When
      let image = try await viewModel.image
      
      // Then
      XCTAssertNotNil(image)
  }

}
