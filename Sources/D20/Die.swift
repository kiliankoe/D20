public struct D {
    public let faces: Int

    public init(_ faces: Int) {
        self.faces = faces
    }

    public var average: Double {
        Double(faces + 1) / 2
    }

    public func roll(mode: RollMode = .random) -> RollResult {
        let roll = calc(mode: mode)
        return RollResult(description: "\(roll)", result: roll)
    }

    private func calc(mode: RollMode) -> Int {
        switch mode {
        case .random:
            return Int.random(in: 1...faces)
        case .max:
            return faces
        case .half:
            return faces / 2
        case .average:
            // FIXME
            return Int(Double(faces + 1) / 2)
        }
    }
}

public extension Array where Element == D {
    func roll(mode: RollMode = .random) -> RollResult {
        let rolls = self.map { $0.roll(mode: mode) }

        let description = rolls.map { $0.description }.joined(separator: " + ")
        let result = rolls.reduce(0) { $0 + $1.result }
        return RollResult(description: description, result: result)
    }
}
