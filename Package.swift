// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "HyBid",
    platforms: [
        .iOS(.v12)
    ],
    products: [
        .library(
            name: "HyBid",
            targets: ["HyBid", "OMSDK_Pubnativenet"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/pubnative/ATOM.git", branch: "support-spm")
    ],
    targets: [
        .binaryTarget(
            name: "HyBid",
            path: "HyBid.xcframework"
        ),
        .binaryTarget(
            name: "OMSDK_Pubnativenet",
            path: "OMSDK_Pubnativenet.xcframework"
        )
    ]
)
