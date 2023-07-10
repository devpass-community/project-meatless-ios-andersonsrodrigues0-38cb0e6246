import XCTest
@testable import MeatlessApp

final class ServiceTests: XCTestCase {

    func testFetchRestaurants() throws {

        let expectation = XCTestExpectation(description: "Restaurant list fetching completed")
        var restaurants: [Restaurant] = []

        let service = Service()
        service.fetchRestaurantList { result in
            
            restaurants = result ?? []
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 3)
        XCTAssertTrue(restaurants.count == 9)
    }
}
