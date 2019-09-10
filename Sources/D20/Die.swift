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
