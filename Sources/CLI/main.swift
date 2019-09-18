import Foundation
import D20

signal(SIGINT) { _ in
    spinner?.unhideCursor()
    exit(0)
}

if CommandLine.arguments.contains("--help") {
    print("USAGE: d20 [optional: dice-formula]")
    exit(1)
}

if let formula = CommandLine.arguments.dropFirst().first {
    guard let roll = Roll(formula) else {
       print("'\(formula)' is an invalid dice formula.")
       exit(1)
    }
    performRoll(roll)
    exit(0)
}

// No input -> REPL mode
while true {
    print("> ", terminator: "")
    let input = readLine() ?? ""
    if let roll = Roll(input) {
        performRoll(roll)
    } else {
        print("'\(input)' is an invalid dice formula.")
    }
}
