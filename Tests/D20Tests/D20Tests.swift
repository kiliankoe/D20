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
            XCTAssert((1...6).contains(die.roll().result))
        }
    }

    func testMultipleDieRoll() {
        let dice = [D(8), D(6), D(6)]
        for _ in 0..<20 {
            XCTAssert((1...20).contains(dice.roll().result))
        }
    }

    func testFormulaParsing() {
        let _1d20 = Roll("1d20")
        XCTAssertEqual(_1d20?.max, 20)

        let _d6 = Roll("d6")
        XCTAssertEqual(_d6?.max, 6)

        let _2d20 = Roll("2d20")
        XCTAssertEqual(_2d20?.max, 40)

        let _1d8plus2 = Roll("1d8+2")
        XCTAssertEqual(_1d8plus2?.max, 10)

        let _2d4times2 = Roll("2d4*2")
        XCTAssertEqual(_2d4times2?.max, 16)

        // Add some more examples from https://en.wikipedia.org/wiki/Dice_notation
    }


    static var allTests = [
        ("testDieAverage", testDieAverage),
        ("testSimpleDieRoll", testSimpleDieRoll),
        ("testMultipleDieRoll", testMultipleDieRoll),
        ("testFormulaParsing", testFormulaParsing),
    ]
}
