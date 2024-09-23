// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "SVSQLite.swift",
    platforms: [
        .iOS(.v11),
        .macOS(.v10_13),
        .watchOS(.v4),
        .tvOS(.v11),
        .visionOS(.v1)
    ],
    products: [
        .library(
            name: "SVSQLite",
            targets: ["SVSQLite"]
        )
    ],
    targets: [
        .target(
            name: "SVSQLite",
            exclude: [
                "Info.plist"
            ]
        ),
        .testTarget(
            name: "SQLiteTests",
            dependencies: [
                "SVSQLite"
            ],
            path: "Tests/SQLiteTests",
            exclude: [
                "Info.plist"
            ],
            resources: [
                .copy("Resources")
            ]
        )
    ]
)

#if os(Linux)
package.dependencies = [
    .package(url: "https://github.com/stephencelis/CSQLite.git", from: "0.0.3")
]
package.targets.first?.dependencies += [
    .product(name: "CSQLite", package: "CSQLite")
]
#endif
