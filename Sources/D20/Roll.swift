import Regex
import MathParser

public struct Roll {
    public let formula: String

    public init?(_ formula: String) {
        self.formula = formula

        let maxExpr = replaceDice { String($0 * D($1).max) }
        guard let _ = try? maxExpr.evaluate() else { return nil }
    }

    /// The maximum value this formula can roll.
    public var max: Int {
        let expr = replaceDice { count, value in
            String(count * D(value).max)
        }
        return Int(try! expr.evaluate())
    }

    /// Half of the maximum this formula can roll.
    public var half: Int {
        let expr = replaceDice { count, value in
            String(count * D(value).half)
        }
        return Int(try! expr.evaluate())
    }

    /// The average value this formula can roll.
    public var average: Double {
        let expr = replaceDice { count, value in
            String(Double(count) * D(value).average)
        }
        return try! expr.evaluate()
    }

    /// Create a custom expression by replacing found dice with a chosen value.
    /// - Parameter closure: Receives the count and value of found dice.
    ///
    /// The following for example produces the output expression if all dice rolled their max value.
    /// ```swift
    /// Roll("1d4*(2d10+1d3)")!.replaceDice { String($0 * D($1).max) }
    /// // $R0: String = "4*(20+3)"
    /// ```
    public func replaceDice(with closure: (Int, Int) -> String) -> String {
        let dieRegex = Regex(#"((\d+)?[dw](\d+))"#)
        var replacedFormula = self.formula
        let matches = dieRegex.allMatches(in: replacedFormula)
        let results = matches.map { match -> String in
            assert(match.captures.count > 0)
            // These unwraps shouldn't fail since the Regex shouldn't match otherwise.
            let count = Int(match.captures[1] ?? "1")!
            let value = Int(match.captures[2]!)!

            return closure(count, value)
        }

        for idx in matches.indices {
            let die = results[idx]
            replacedFormula = replacedFormula.replacingFirst(matching: dieRegex, with: die)
        }

        return replacedFormula
    }

    /// Roll the dice!
    /// - Parameter collapseSingle: If set to `true`, multiple dice of the same type (e.g. 2d10) will be
    ///                             collapsed to a single result, e.g. 8 and not shown separately as 3+5
    ///                             in the result expression. This only applies to dice specifed with a
    ///                             count > 1. "1d10+1d10" would always be displayed separately.
    public func roll(collapseSingle: Bool = false) -> RollResult {
        let expression = replaceDice { count, value in
            if collapseSingle {
                return String(count * D(value).roll())
            } else {
                return Array<D>(repeating: D(value), count: count)
                .map { $0.roll() }
                .map(String.init)
                .joined(separator: "+")
            }
        }
        let result = Int(try! expression.evaluate())
        return RollResult(expression: expression, result: result)
    }
}

public struct RollResult {
    public let expression: String
    public let result: Int
}
