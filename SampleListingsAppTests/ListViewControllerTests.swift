//
//  ListingViewControllerTests.swift
//  SampleListingsAppTests
//
//  Created by Muhammad Zulqurnain on 26/03/2023.
//

// ListViewControllerTests.swift

import XCTest
@testable import SampleListingsApp

class ListViewControllerTests: XCTestCase {

    var sut: ListViewController!
    var mockListViewModel: MockListViewModel!

    override func setUpWithError() throws {
        mockListViewModel = MockListViewModel()
        sut = ListViewController(viewModel: mockListViewModel)
        sut.loadViewIfNeeded()
    }

    override func tearDownWithError() throws {
        sut = nil
        mockListViewModel = nil
    }

    func testTableViewDataSource() throws {
        XCTAssertEqual(sut.tableView.dataSource?.tableView(sut.tableView, numberOfRowsInSection: 0), 1)
    }

    func testTableViewDelegate() throws {
        let tableViewDelegate = sut.tableView.delegate
        let indexPath = IndexPath(row: 0, section: 0)
        let expectedListing = Listing(id: 1, title: "Listing 1", completed: false)
        mockListViewModel.listings = [expectedListing]

        tableViewDelegate?.tableView?(sut.tableView, didSelectRowAt: indexPath)

        XCTAssertTrue(mockListViewModel.didSelectListingCalled)
        XCTAssertEqual(mockListViewModel.selectedListing, expectedListing)
    }

}
