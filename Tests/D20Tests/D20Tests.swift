import XCTest
import D20

final class D20Tests: XCTestCase {
    func testDieAverage() {
        XCTAssertEqual(D(4).average, 2.5)
        XCTAssertEqual(D(20).average, 10.5)

        let _1d8 = D(8).average
        let _3d6 = D(6).average * 3
        XCTAssertEqual(_1d8 + _3d6, 15)
    }

    func testSimpleDieRoll() {
        for _ in 0..<20 {
            let die = D(6)
            let roll = die.roll()
            XCTAssertEqual(roll.max, 6)
            XCTAssertEqual(roll.half, 3)
            XCTAssert((1...6).contains(roll.result))
        }
    }

    static var allTests = [
        ("testSimpleDieRoll", testSimpleDieRoll),
    ]
}
