// swift-tools-version:4.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "Digests",
  products: [
    .library(name: "Digests", targets: ["Digests"]),
  ],
  dependencies: [
    .package(url: "https://github.com/IBM-Swift/CommonCrypto", from: "1.0.0")
  ],
  targets: [
    .target(name: "Digests", dependencies: ["CommonCrypto"]),
    .testTarget(name: "DigestsTests", dependencies: ["Digests"]),
    ],
  swiftLanguageVersions: [4]
)
