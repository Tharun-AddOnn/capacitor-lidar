import Foundation
import ARKit

@available(iOS 16.0, *)
@objc public class Lidar: NSObject {
    @objc public func isLiDARAvailable() -> Bool {
        return ARWorldTrackingConfiguration.supportsSceneReconstruction(.mesh)
    }

    @objc public func startScan(){}
}
