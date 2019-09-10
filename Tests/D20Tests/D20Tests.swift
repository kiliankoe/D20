import XCTest
@testable import D20

final class D20Tests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(D20().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
