import CLIKit
import D20

class RollCommand: Command {
    let description = "Roll the dice!"

    @CommandFlag(name: "skipRolling", short: "s", description: "Skip rolling output")
    var skipRolling: Bool

    @CommandFlag(name: "verbose", short: "v", description: "Print verbose output")
    var verbose: Bool

    @CommandRequiredInput(regex: #"(\d+)?[dw]\d+"#, description: "Dice formula")
    var formula: String

    func run() throws {
        let roll = Roll(formula)!
        let result = roll.roll()
        if !skipRolling {
            outputRolling()
        }
        if verbose {
            Console.print("\(.bold)\(result.result)\(.reset) \(result.expression)")
        } else {
            Console.print("\(.bold)\(result.result)")
        }
    }
}
