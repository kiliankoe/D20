// swift-tools-version:5.1

import PackageDescription

let package = Package(
    name: "D20",
    products: [
        .library(
            name: "D20",
            targets: ["D20"]),
    ],
    dependencies: [
        .package(url: "https://github.com/sharplet/Regex", from: "2.1.0"),
        // Using a fork temporarily as the upstream package layout is currently incompatible.
        .package(url: "https://github.com/davedelong/DDMathParser", from: "3.1.0"),
    ],
    targets: [
        .target(
            name: "D20",
            dependencies: ["Regex", "MathParser"]),
        .testTarget(
            name: "D20Tests",
            dependencies: ["D20"]),
    ]
)
