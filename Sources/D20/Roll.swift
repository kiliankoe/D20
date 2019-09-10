import Parsel

public struct Roll {
    public let formula: String
//    private let term: Foo

    public init?(_ formula: String) {
        guard !formula.isEmpty else { return nil }
        self.formula = formula


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
