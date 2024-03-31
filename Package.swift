// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "andhashUtilities",
    platforms: [
        .iOS("17.0"),
        .macOS("13.0"),
    ],
    products: [
        .library(name: "Extensions", targets: ["Extensions"]),
        .library(name: "Views", targets: ["Views"]),
    ],
    targets: [
        .target(name: "Extensions"),
        .testTarget(name: "ExtensionsTests", dependencies: ["Extensions"]),
        .target(name: "Views"),
    ]
)
