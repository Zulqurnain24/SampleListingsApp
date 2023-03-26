//
//  DetailViewControllerTest.swift
//  SampleListingsAppTests
//
//  Created by Muhammad Zulqurnain on 26/03/2023.
//

import XCTest
@testable import SampleListingsApp

class DetailViewControllerTests: XCTestCase {
    
    var sut: DetailViewController!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        let listing = Listing(id: 12, title: "Test List Item")
        sut = DetailViewController(item: listing)
        sut.loadViewIfNeeded()
    }

    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }
    
    func testViewDidLoad_SetsTitleLabelText() throws {
      XCTAssertEqual(sut.title, "Test Listing")
    }
    
    func testViewDidLoad_SetsCompletedLabelColor() throws {
      XCTAssertEqual(sut.likeButton.titleLabel?.textColor, UIColor.systemGreen)
    }
    
    func testLikeButtonPressed_TogglesIsLiked() throws {
        sut.likeButton.sendActions(for: .touchUpInside)
        XCTAssertTrue(sut.viewModel.isLiked)
        sut.likeButton.sendActions(for: .touchUpInside)
        XCTAssertFalse(sut.viewModel.isLiked)
    }

}
