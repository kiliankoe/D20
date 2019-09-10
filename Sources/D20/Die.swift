public struct D {
    public let faces: Int

    public init(_ faces: Int) {
        self.faces = faces
    }

    public var average: Double {
        Double(faces + 1) / 2
    }

    public func roll() -> Roll {
        Roll(dice: [self], result: Int.random(in: 1...faces), max: faces, half: faces / 2)
    }
}

public extension Array where Element == D {
    func roll() -> Roll {
        let rolls = self.map { $0.roll() }
        let result = rolls.reduce(0) { $0 + $1.result }
        let max = rolls.reduce(0) { $0 + $1.max }
        return Roll(dice: self, result: result, max: max, half: max / 2)
    }
}
