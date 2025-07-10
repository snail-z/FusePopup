// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

// swift-tools-version:5.0
import PackageDescription

let package = Package(
    name: "FusePopup",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(
            name: "FusePopup",  
            targets: ["FusePopup"]
        ),
    ],
    targets: [
        .target(
            name: "FusePopup",
            dependencies: [],
            path: "Sources",
            resources: [.process("PrivacyInfo.xcprivacy")]
        )
    ]
)
