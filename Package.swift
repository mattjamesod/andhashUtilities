// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AndHashUtilities",
    platforms: [
        .iOS("17.0"),
        .macOS("14.0"),
    ],
    products: [
        .library(name: "Logging", targets: ["Logging"]),
        .library(name: "UtilAlgorithms", targets: ["UtilAlgorithms"]),
        .library(name: "UtilExtensions", targets: ["UtilExtensions"]),
        .library(name: "UtilViews", targets: ["UtilViews"]),
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-async-algorithms", from: "0.1.0"),
    ],
    targets: [
        .target(name: "Logging"),
        .target(name: "UtilAlgorithms"),
        .target(name: "UtilExtensions"),
        .testTarget(name: "UtilExtensionsTests", dependencies: ["UtilExtensions"]),
        .target(
            name: "UtilViews",
            dependencies: [ .product(name: "AsyncAlgorithms", package: "swift-async-algorithms") ]
        ),
    ]
)
