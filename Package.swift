// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "IfcPlusPlus",
  platforms: [.macOS(.v12), .iOS(.v15)],
  products: [
    .library(
      name: "IfcPlusPlus",
      targets: ["IfcPlusPlus"]
    )
  ],
  targets: [
    .target(
      name: "IfcPlusPlus",
      path: "IfcPlusPlus",
      exclude: [
        "src/external"
      ],
      publicHeadersPath: "src"
    )
  ],
  cxxLanguageStandard: .cxx11
)
