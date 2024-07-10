import Foundation

@objc public class Lidar: NSObject {
    @objc public func isLiDARAvailable() -> Boolean {
        return ARWorldTrackingConfiguration.supportsSceneReconstruction(.mesh)
    }

    @objc public func startScan(){}
}
