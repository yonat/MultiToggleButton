// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "MultiToggleButton",
    platforms: [
        .iOS(.v11),
    ],
    products: [
        .library(name: "MultiToggleButton", targets: ["MultiToggleButton"]),
    ],
    dependencies: [
        .package(url: "https://github.com/yonat/SweeterSwift", from: "1.0.2"),
    ],
    targets: [
        .target(name: "MultiToggleButton", dependencies: ["SweeterSwift"], path: "Sources", resources: [.copy("PrivacyInfo.xcprivacy")]),
    ],
    swiftLanguageVersions: [.v5]
)
