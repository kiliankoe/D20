import Foundation
import CLISpinner
import Rainbow
import D20

var spinner: Spinner?

func performRoll(_ roll: Roll) {
    //let dice = Spinner(pattern: Pattern.multiple(["⚀", "⚁", "⚂", "⚃", "⚄", "⚅"]))

    var values: [Int] = []
    for _ in 0..<20 {
        values.append(Int.random(in: 1...roll.max))
    }
    spinner = Spinner(pattern: Pattern.multiple(values.map(String.init)))
    spinner?.start()
    usleep(700_000)
    spinner?.stopAndClear()

    let result = roll.roll()

    print("\(String(result.result).bold) \(result.expression)")

    if result.result == roll.max {
        print("CRIT!".red.bold)
    }
}
