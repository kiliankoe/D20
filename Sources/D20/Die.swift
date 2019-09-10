public struct D {
    public let faces: Int

    public init(_ faces: Int) {
        self.faces = faces
    }

    public var average: Double {
        Double(faces + 1) / 2
    }

    public func roll() -> RollResult {
        let roll = Int.random(in: 1...faces)
        return RollResult(description: "\(roll)", result: roll)
    }
}

public extension Array where Element == D {
    func roll() -> RollResult {
        let rolls = self.map { $0.roll() }

        let description = rolls.map { $0.description }.joined(separator: " + ")
        let result = rolls.reduce(0) { $0 + $1.result }
        return RollResult(description: description, result: result)
    }
}
