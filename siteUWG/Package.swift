// swift-tools-version:5.1

import PackageDescription

let package = Package(
    name: "SiteUWG",
    products: [
        .executable(name: "SiteUWG", targets: ["SiteUWG"])
    ],
    dependencies: [
        .package(url: "https://github.com/johnsundell/publish.git", from: "0.3.0")
    ],
    targets: [
        .target(
            name: "SiteUWG",
            dependencies: ["Publish"]
        )
    ]
)