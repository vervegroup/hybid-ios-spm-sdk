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
        ),
        .library(
            name: "GoogleMobileAdsHyBidAdapters",
            targets: ["GoogleMobileAdsHyBidAdapters"]
        ),
        .library(
            name: "IronSourceHyBidAdapters",
            targets: ["IronSourceHyBidAdapters"]
        ),
        .library(
            name: "AppLovinMediationVerveCustomNetworkAdapter",
            targets: ["AppLovinMediationVerveCustomNetworkAdapter"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/pubnative/ATOM.git", from: "3.9.0"),
        .package(url: "https://github.com/googleads/swift-package-manager-google-mobile-ads.git", exact: "12.14.0"),
        .package(url: "https://github.com/ironsource-mobile/Unity-Mediation-iAds-Swift-Package.git", .upToNextMajor(from: "9.3.0")),
        .package(url: "https://github.com/ironsource-mobile/Unity-Ad-Quality-Swift-Package.git", .upToNextMajor(from: "9.2.1")),
        .package(url: "https://github.com/AppLovin/AppLovin-MAX-Swift-Package.git", .upToNextMajor(from: "13.0.0"))
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
        ),
        .target(
            name: "GoogleMobileAdsHyBidAdapters",
            dependencies: [
                "HyBidDependencies",
                .product(name: "GoogleMobileAds", package: "swift-package-manager-google-mobile-ads")
            ],
            path: "GoogleMobileAdsAdapters",
            publicHeadersPath: ".",
            cSettings: [
                .headerSearchPath("."),
                .headerSearchPath("GAD"),
                .headerSearchPath("GAM")
            ]
        ),
        .target(
            name: "IronSourceHyBidAdapters",
            dependencies: [
                "HyBidDependencies",
                .product(name: "UnityMediationSDK", package: "Unity-Mediation-iAds-Swift-Package"),
                .product(name: "AdQuality", package: "Unity-Ad-Quality-Swift-Package")
            ],
            path: "ironSourceAdapters",
            sources: [
                "ISVerveCustomAdapter.m",
                "ISVerveCustomBanner.m",
                "ISVerveCustomInterstitial.m",
                "ISVerveCustomRewardedVideo.m",
                "ISVerveUtils.m"
            ],
            publicHeadersPath: ".",
            cSettings: [
                .headerSearchPath(".")
            ]
        ),
        .target(
            name: "AppLovinMediationVerveCustomNetworkAdapter",
            dependencies: [
                "HyBidDependencies",
                .product(name: "AppLovinSDK", package: "AppLovin-MAX-Swift-Package")
            ],
            path: "AppLovinAdapters",
            sources: [
                "AppLovinMediationVerveCustomNetworkAdapter.m"
            ],
            publicHeadersPath: ".",
            cSettings: [
                .headerSearchPath(".")
            ]
        )
    ]
)
