import PackageDescription

let package = Package(
    name: "DeviantWay",
    targets: [
        Target(name: "DeviantArtApi"),
        Target(name: "App", dependencies: ["DeviantArtApi"]),
    ],
    dependencies: [
        .Package(url: "https://github.com/vapor/vapor.git", majorVersion: 2),
    ],
    exclude: [
        "Config",
        "Database",
        "Localization",
        "Public",
        "Resources",
    ]
)

