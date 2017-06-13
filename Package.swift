import PackageDescription

let package = Package(
    name: "DeviantWay",
    targets: [
        Target(name: "App"),
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

