import Parsel

public enum D20 {
    public static func roll(formula: String) -> Roll {
        let rollParser = Parser<String, Roll> { input in
            return .success(result: Roll(dice: [], result: 1, max: 1, half: 1), rest: input)
        }
        let result = try! rollParser.parse(formula).unwrap()
        return result
    }
}
