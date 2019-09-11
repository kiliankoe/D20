public struct D {
    public let faces: Int

    public init(_ faces: Int) {
        self.faces = faces
    }

    public var max: Int {
        faces
    }

    public var half: Int {
        faces / 2
    }

    public var average: Double {
        Double(faces + 1) / 2
    }

    public func roll() -> Int {
        Int.random(in: 1...faces)
    }
}
