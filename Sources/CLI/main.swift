import Foundation
import CLISpinner
import Rainbow
import D20

guard let formula = CommandLine.arguments.dropFirst().first else {
    print("USAGE: d20 [dice-formula]")
    exit(1)
}

guard let roll = Roll(formula) else {
    print("'\(formula)' is an invalid dice formula.")
    exit(1)
}

//let dice = Spinner(pattern: Pattern.multiple(["⚀", "⚁", "⚂", "⚃", "⚄", "⚅"]))

var values: [Int] = []
for _ in 0..<20 {
    values.append(Int.random(in: 1...roll.max))
}
let dice = Spinner(pattern: Pattern.multiple(values.map(String.init)))

signal(SIGINT) { _ in
    dice.unhideCursor()
    exit(0)
}

dice.start()
usleep(700_000)
dice.stopAndClear()

let result = roll.roll()

print("\(String(result.result).bold) \(result.expression)")

if result.result == roll.max {
    print("CRIT!".red.bold)
}
