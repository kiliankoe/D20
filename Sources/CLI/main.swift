import CLIKit

let command = try CommandLineParser().parse(command: RollCommand())
try command.run()
