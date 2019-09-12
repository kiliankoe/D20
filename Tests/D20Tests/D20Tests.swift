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
            XCTAssert((1...6).contains(die.roll()))
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

        let _1d4times2d10plus1d3 = Roll("1d4*(2d10+1d3)")
        XCTAssertEqual(_1d4times2d10plus1d3?.max, 92)
        let maxExpression = _1d4times2d10plus1d3?.replaceDice { String($0 * D($1).max) }
        XCTAssertEqual(maxExpression, "4*(20+3)")

        // Add some more examples from https://en.wikipedia.org/wiki/Dice_notation
    }

    func testInvalidFormulae() {
        let invalid = [
            "",
            "!",
            "1d",
            "5+(1",
        ]

        for formula in invalid {
            XCTAssertNil(Roll(formula))
        }
    }

    static var allTests = [
        ("testDieAverage", testDieAverage),
        ("testSimpleDieRoll", testSimpleDieRoll),
        ("testFormulaParsing", testFormulaParsing),
        ("testInvalidFormulae", testInvalidFormulae),
    ]
}
