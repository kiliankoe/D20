public struct Roll {
    public let dice: [D]
    public let result: Int
    public let max: Int
    public let half: Int
}

extension Roll: CustomStringConvertible {
    public var description: String {
        "\(result) (max: \(max), half: \(half))"
    }
}
