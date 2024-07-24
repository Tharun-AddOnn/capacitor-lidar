// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "Lidar",
    platforms: [.iOS(.v16)],
    products: [
        .library(
            name: "Lidar",
            targets: ["LidarPlugin","RoomCaptureViewController"])
    ],
    dependencies: [
        .package(url: "https://github.com/ionic-team/capacitor-swift-pm.git", branch: "main")
    ],
    targets: [
        .target(
            name: "LidarPlugin",
            dependencies: [
                .product(name: "Capacitor", package: "capacitor-swift-pm"),
                .product(name: "Cordova", package: "capacitor-swift-pm")
            ],
            path: "ios/Sources/LidarPlugin"),
        .testTarget(
            name: "LidarPluginTests",
            dependencies: ["LidarPlugin"],
            path: "ios/Tests/LidarPluginTests")
    ]
)