// swift-tools-version: 5.5

import PackageDescription

let package = Package(
    name: "AppsShowcase",
    defaultLocalization: "en",
    platforms: [
        .iOS(.v13),
        .macOS(.v12),
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
