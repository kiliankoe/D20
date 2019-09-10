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
        let die = D(6)
        for _ in 0..<20 {
            let roll = die.roll()
            XCTAssertEqual(roll.max, 6)
            XCTAssertEqual(roll.half, 3)
            XCTAssert((1...6).contains(roll.result))
        }
    }

    func testMultipleDieRoll() {
        // 1d8 + 3d6
        let dice = [D(8), D(6), D(6), D(6)]
        for _ in 0..<20 {
            let roll = dice.roll()
            XCTAssertEqual(roll.max, 26)
            XCTAssertEqual(roll.half, 13)
            XCTAssert((1...26).contains(roll.result))
        }
    }

    func testFormulaParsing() {
        let roll = D20.roll(formula: "1d20")
        XCTAssertEqual(roll.max, 20)
    }

    static var allTests = [
        ("testDieAverage", testDieAverage),
        ("testSimpleDieRoll", testSimpleDieRoll),
        ("testMultipleDieRoll", testMultipleDieRoll),
        ("testMultipleDieRoll", testMultipleDieRoll),
    ]
}
