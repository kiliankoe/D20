import Foundation
import CLIKit

func outputRolling() {
    for _ in 0..<10 {
        let rand = Int.random(in: 10...99)
        Console.write(String(rand))
        usleep(50_000) // 50ms
        Console.clearLine()
    }
}
