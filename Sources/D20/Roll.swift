import class Foundation.NSExpression
import Regex

public struct Roll {
    public let formula: String

    public init?(_ formula: String) {
        guard !formula.isEmpty else { return nil }
        self.formula = formula
    }

    public var max: Int {
        roll(mode: .max).result
    }

    public var half: Int {
        roll(mode: .half).result
    }

    public var average: Double {
        return 1.0
//        return roll(mode: .average)
    }

    public func roll(mode: RollMode = .random) -> RollResult {
        let expression = rollDiceRolls(in: self.formula, mode: mode)
        let mathExpression = NSExpression(format: expression)
        guard let result = mathExpression.expressionValue(with: nil, context: nil) as? Int else {
            fatalError("Failed to compute '\(expression)'")
        }
        return RollResult(description: expression, result: result)
    }

    private func rollDiceRolls(in formula: String, mode: RollMode) -> String {
        let dieRegex = Regex(#"(\d+)?[dw](\d+)"#)
        let matches = dieRegex.allMatches(in: formula)
        let results = matches.map { match -> Int in
            // FIXME: This unwrapping is ridiculous.
            let diceCount = Int(match.captures.first! ?? "1")!
            let value = Int(match.captures.last!!)!

            let dice = Array<D>(repeating: D(value), count: diceCount)
            return dice.roll(mode: mode).result
        }
        var copy = formula
        for (idx, match) in matches.enumerated() {
            copy = copy.replacingFirst(matching: dieRegex, with: String(results[idx]))
        }

        return copy
    }
}

public struct RollResult {
    public let description: String
    public let result: Int
}

public enum RollMode {
    case random
    case max
    case half
    case average
}
