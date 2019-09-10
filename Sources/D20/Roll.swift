import Parsel

public struct Roll {
    public let formula: String

    public init(_ formula: String) {
        self.formula = formula

//        let rollParser = Parser<String, Roll> { input in
//            return .success(result: Roll, rest: input)
//        }
//        let result = try! rollParser.parse(formula).unwrap()
    }

    public var max: Int {
        return 1
    }

    public var half: Int {
        return 1
    }

    public var average: Double {
        return 1.0
    }

    public func roll() -> RollResult {
        fatalError("not yet implemented")
    }
}

public struct RollResult {
    public let description: String
    public let result: Int
}

extension RollResult: CustomStringConvertible {
    public var description: String {
        String(result)
    }
}
