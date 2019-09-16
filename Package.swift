// swift-tools-version:5.1

import PackageDescription

let package = Package(
    name: "D20",
    platforms: [
        .macOS(.v10_14),
    ],
    products: [
        .library(
            name: "D20",
            targets: ["D20"]),
        .executable(
            name: "d20",
            targets: ["CLI"]),
    ],
    dependencies: [
        .package(url: "https://github.com/sharplet/Regex", from: "2.1.0"),
        .package(url: "https://github.com/davedelong/DDMathParser", from: "3.1.0"),
        .package(url: "https://github.com/onevcat/Rainbow", from: "3.0.0"),
        .package(url: "https://github.com/kiliankoe/CLISpinner", from: "0.4.0"),
    ],
    targets: [
        .target(
            name: "D20",
            dependencies: ["Regex", "MathParser"]),
        .target(
            name: "CLI",
            dependencies: ["D20", "Rainbow", "CLISpinner"]),
        .testTarget(
            name: "D20Tests",
            dependencies: ["D20"]),
    ]
)
