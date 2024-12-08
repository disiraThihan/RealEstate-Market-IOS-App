//
//  RealEstate_MarketTests.swift
//  RealEstate-MarketTests
//
//  Created by Disira Thihan on 2024-06-05.
//

//import XCTest
//import FirebaseCore
//
//@testable import RealEstate_Market
//
//final class RealEstate_MarketTests: XCTestCase {
//
//    override func setUpWithError() throws {
//        // Put setup code here. This method is called before the invocation of each test method in the class.
//    }
//
//    override func tearDownWithError() throws {
//        // Put teardown code here. This method is called after the invocation of each test method in the class.
//    }
//
//    func testExample() throws {
//        // This is an example of a functional test case.
//        // Use XCTAssert and related functions to verify your tests produce the correct results.
//        // Any test you write for XCTest can be annotated as throws and async.
//        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
//        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
//    }
//
//    func testPerformanceExample() throws {
//        // This is an example of a performance test case.
//        self.measure {
//            // Put the code you want to measure the time of here.
//        }
//    }
//
//}

import XCTest
import Firebase
@testable import RealEstate_Market

final class RealEstateViewModelTests: XCTestCase {
    
    // MARK: - Mocking Firebase Services
    
    class MockFirestore: Firestore {
        var querySnapshot: QuerySnapshot?
        var error: Error?
        
    }
    
    // MARK: - Test Cases
    
//    func testFetchAllRealEstatesAllSuccess() {
//        // Given
//        let viewModel = RealEstateViewModel()
//        let mockFirestore = MockFirestore()
//        Firestore.firestore = { return mockFirestore }()
//        let expectedRealEstates = [
//            RealEstate(id: "1", idUser: "user1", title: "Title1", description: "Description1", imageURL: "URL1", price: 1000, location: "Location1", rating: 5, type: "Type1", isFavorite: false, size: 100, bedrooms: 2, bathrooms: 1, yearBuilt: 2020)
//        ]
//        let mockQuerySnapshot = QuerySnapshot()
//        mockFirestore.querySnapshot = mockQuerySnapshot
//        
//        // When
//        let expectation = self.expectation(description: "Fetch all real estate properties")
//        viewModel.fetchAllRealEstatesAll { realEstates, error in
//            // Then
//            XCTAssertEqual(realEstates, expectedRealEstates)
//            XCTAssertNil(error)
//            expectation.fulfill()
//        }
//        
//        waitForExpectations(timeout: 5, handler: nil)
//    }
//    
//    func testFetchAllRealEstatesAllFailure() {
//        // Given
//        let viewModel = RealEstateViewModel()
//        let mockFirestore = MockFirestore()
//        Firestore.firestore = { return mockFirestore }()
//        let expectedError = NSError(domain: "Test", code: 500, userInfo: nil)
//        mockFirestore.error = expectedError
//        
//        // When
//        let expectation = self.expectation(description: "Fetch all real estate properties failure")
//        viewModel.fetchAllRealEstatesAll { realEstates, error in
//            // Then
//            XCTAssertNil(realEstates)
//            XCTAssertNotNil(error)
//            XCTAssertEqual(error as NSError?, expectedError)
//            expectation.fulfill()
//        }
//        
//        waitForExpectations(timeout: 5, handler: nil)
//    }
    
    func testAddRealEstateSuccess() {
        // Given
        let realEstate = RealEstate(id: "", idUser: "", title: "Test Title", description: "Test Description", imageURL: "", price: 1000, location: "Test Location", rating: 5, type: "Test Type", isFavorite: false, size: 100, bedrooms: 2, bathrooms: 2, yearBuilt: 2020)
        let viewModel = RealEstateViewModel()
        
        // When
        let expectation = self.expectation(description: "Add real estate property")
        viewModel.addRealEstate(realEstate: realEstate) { success, error in
            // Then
            XCTAssertTrue(success)
            XCTAssertNil(error)
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 5, handler: nil)
    }
    
    func testAddRealEstateFailure() {
        // Given
        let realEstate = RealEstate(id: "", idUser: "", title: "Test Title", description: "Test Description", imageURL: "", price: 1000, location: "Test Location", rating: 5, type: "Test Type", isFavorite: false, size: 100, bedrooms: 2, bathrooms: 2, yearBuilt: 2020)
        let viewModel = RealEstateViewModel()
        
        // When
        let expectation = self.expectation(description: "Add real estate property failure")
        viewModel.addRealEstate(realEstate: realEstate) { success, error in
            // Then
            XCTAssertFalse(success)
            XCTAssertNotNil(error)
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 5, handler: nil)
    }
    
//    func testFetchRealEstatesSuccess() {
//        // Given
//        let viewModel = RealEstateViewModel()
//        let mockFirestore = MockFirestore()
//        Firestore.firestore = { return mockFirestore }()
//        let expectedRealEstates = [
//            RealEstate(id: "1", idUser: "user1", title: "Title1", description: "Description1", imageURL: "URL1", price: 1000, location: "Location1", rating: 5, type: "Type1", isFavorite: false, size: 100, bedrooms: 2, bathrooms: 1, yearBuilt: 2020)
//        ]
//        let mockQuerySnapshot = QuerySnapshot()
//        mockFirestore.querySnapshot = mockQuerySnapshot
//        
//        // When
//        let expectation = self.expectation(description: "Fetch real estate properties for the current user")
//        viewModel.fetchRealEstates { realEstates, error in
//            // Then
//            XCTAssertEqual(realEstates, expectedRealEstates)
//            XCTAssertNil(error)
//            expectation.fulfill()
//        }
//        
//        waitForExpectations(timeout: 5, handler: nil)
//    }
    
//    func testFetchRealEstatesFailure() {
//        // Given
//        let viewModel = RealEstateViewModel()
//        let mockFirestore = MockFirestore()
//        Firestore.firestore = { return mockFirestore }()
//        let expectedError = NSError(domain: "Test", code: 500, userInfo: nil)
//        mockFirestore.error = expectedError
//        
//        // When
//        let expectation = self.expectation(description: "Fetch real estate properties failure")
//        viewModel.fetchRealEstates { realEstates, error in
//            // Then
//            XCTAssertNil(realEstates)
//            XCTAssertNotNil(error)
//            XCTAssertEqual(error as NSError?, expectedError)
//            expectation.fulfill()
//        }
//        
//        waitForExpectations(timeout: 5, handler: nil)
//    }
//    
    func testUpdateRealEstateSuccess() {
        // Given
        let realEstate = RealEstate(id: "testId", idUser: "", title: "Updated Title", description: "Updated Description", imageURL: "", price: 2000, location: "Updated Location", rating: 4, type: "Updated Type", isFavorite: true, size: 200, bedrooms: 3, bathrooms: 3, yearBuilt: 2021)
        let viewModel = RealEstateViewModel()
        
        // When
        let expectation = self.expectation(description: "Update real estate property")
        viewModel.updateRealEstate(realEstate: realEstate) { success, error in
            // Then
            XCTAssertTrue(success)
            XCTAssertNil(error)
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 5, handler: nil)
    }
    
    func testUpdateRealEstateFailure() {
        // Given
        let realEstate = RealEstate(id: "invalidId", idUser: "", title: "Updated Title", description: "Updated Description", imageURL: "", price: 2000, location: "Updated Location", rating: 4, type: "Updated Type", isFavorite: true, size: 200, bedrooms: 3, bathrooms: 3, yearBuilt: 2021)
        let viewModel = RealEstateViewModel()
        
        // When
        let expectation = self.expectation(description: "Update real estate property failure")
        viewModel.updateRealEstate(realEstate: realEstate) { success, error in
            // Then
            XCTAssertFalse(success)
            XCTAssertNotNil(error)
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 5, handler: nil)
    }
    
    func testDeleteRealEstateSuccess() {
        // Given
        let viewModel = RealEstateViewModel()
        
        // When
        let expectation = self.expectation(description: "Delete real estate property")
        viewModel.deleteRealEstate(realEstateId: "testId") { success, error in
            // Then
            XCTAssertTrue(success)
            XCTAssertNil(error)
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 5, handler: nil)
    }
    
    func testDeleteRealEstateFailure() {
        // Given
        let viewModel = RealEstateViewModel()
        
        // When
        let expectation = self.expectation(description: "Delete real estate property failure")
        viewModel.deleteRealEstate(realEstateId: "invalidId") { success, error in
            // Then
            XCTAssertFalse(success)
            XCTAssertNotNil(error)
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 5, handler: nil)
    }
    
    func testFetchRealEstateIdSuccess() {
        // Given
        let realEstate = RealEstate(id: "testId", idUser: "", title: "Test Title", description: "Test Description", imageURL: "", price: 1000, location: "Test Location", rating: 5, type: "Test Type", isFavorite: false, size: 100, bedrooms: 2, bathrooms: 2, yearBuilt: 2020)
        let viewModel = RealEstateViewModel()
        
        // When
        let expectation = self.expectation(description: "Fetch real estate ID")
        viewModel.fetchRealEstateId(for: realEstate) { realEstateId in
            // Then
            XCTAssertNotNil(realEstateId)
            XCTAssertEqual(realEstateId, "testId")
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 5, handler: nil)
    }
    
    func testFetchRealEstateIdFailure() {
        // Given
        let realEstate = RealEstate(id: "invalidId", idUser: "", title: "Invalid Title", description: "Invalid Description", imageURL: "", price: 0, location: "Invalid Location", rating: 0, type: "Invalid Type", isFavorite: false, size: 0, bedrooms: 0, bathrooms: 0, yearBuilt: 0)
        let viewModel = RealEstateViewModel()
        
        // When
        let expectation = self.expectation(description: "Fetch real estate ID failure")
        viewModel.fetchRealEstateId(for: realEstate) { realEstateId in
            // Then
            XCTAssertNil(realEstateId)
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 5, handler: nil)
    }
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
}

