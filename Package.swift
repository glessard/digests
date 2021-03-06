// swift-tools-version:4.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "Digests",
  products: [
    .library(name: "Digests", targets: ["Digests"]),
  ],
  dependencies: [],
  targets: [
    .target(name: "Digests", dependencies: []),
    .testTarget(name: "DigestsTests", dependencies: ["Digests"]),
  ],
  swiftLanguageVersions: [.v4_2, .version("5")]
)
