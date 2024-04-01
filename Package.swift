// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AndHashUtilities",
    platforms: [
        .iOS("17.0"),
        .macOS("13.0"),
    ],
    products: [
        .library(name: "UtilExtensions", targets: ["UtilExtensions"]),
        .library(name: "UtilViews", targets: ["UtilViews"]),
    ],
    targets: [
        .target(name: "UtilExtensions"),
        .testTarget(name: "UtilExtensionsTests", dependencies: ["UtilExtensions"]),
        .target(name: "UtilViews"),
    ]
)
