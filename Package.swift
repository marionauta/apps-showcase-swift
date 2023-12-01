// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "AppsShowcase",
    defaultLocalization: "en",
    platforms: [
        .iOS(.v13),
        .macOS(.v10_15),
        .tvOS(.v13),
        .watchOS(.v6),
    ],
    products: [
        .library(
            name: "AppsShowcase",
            targets: ["AppsShowcase"]),
    ],
    targets: [
        .target(
            name: "AppsShowcase",
            resources: [
                .process("Resources"),
            ]
        ),
    ]
)
