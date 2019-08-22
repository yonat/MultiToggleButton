// swift-tools-version:5.1

import PackageDescription

let package = Package(
    name: "MultiToggleButton",
    platforms: [
        .iOS(.v9)
    ],
    products: [
        .library( name: "MultiToggleButton", targets: ["MultiToggleButton"])
    ],
    dependencies: [
        .package(url: "https://github.com/yonat/SweeterSwift", from: "1.0.2")
    ],
    targets: [
        .target(name: "MultiToggleButton", dependencies: ["SweeterSwift"], path: "Sources")
    ],
    swiftLanguageVersions: [.v5]
)
