// swift-tools-version:5.9

import PackageDescription

let package = Package(
    name: "HyBid",
    platforms: [
        .iOS(.v12)
    ],
    products: [
        .library(
            name: "HyBid",
            targets: ["HyBidDependencies"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/pubnative/ATOM.git", from: "3.8.0-spm.1")
    ],
    targets: [
        .binaryTarget(
            name: "HyBidBinary",
            path: "HyBid.xcframework"
        ),
        .binaryTarget(
            name: "OMSDK_Pubnativenet",
            path: "OMSDK_Pubnativenet.xcframework"
        ),
        .target(
            name: "HyBidDependencies",
            dependencies: [
                "HyBidBinary",
                "OMSDK_Pubnativenet",
                .product(name: "ATOM", package: "ATOM")
            ],
            path: "Sources"
        )
    ]
)
