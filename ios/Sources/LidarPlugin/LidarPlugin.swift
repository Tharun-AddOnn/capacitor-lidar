import Foundation
import Capacitor
import ARKit
import RoomPlan
import UIKit

@available(iOS 16.0, *)
/**
 * Please read the Capacitor iOS Plugin Development Guide
 * here: https://capacitorjs.com/docs/plugins/ios
 */
@objc(LidarPlugin)
public class LidarPlugin: CAPPlugin, CAPBridgedPlugin, ScanDelegate {
    public let identifier = "LidarPlugin"
    public let jsName = "Lidar"
    public let pluginMethods: [CAPPluginMethod] = [
        CAPPluginMethod(name: "isLiDARAvailable", returnType: CAPPluginReturnPromise),
        CAPPluginMethod(name: "startScan", returnType: CAPPluginReturnPromise)
    ]
    private let implementation = Lidar()

    private var roomCaptureViewController: RoomCaptureViewController?
    private var scanCallbackId: String?

    public override func load() {
        self.scanCallbackId = nil
    }
  
    @objc func isLiDARAvailable(_ call: CAPPluginCall) {
        let available = ARWorldTrackingConfiguration.supportsSceneReconstruction(.mesh)
        call.resolve([
            "available": available
        ])
    }

    @objc func startScan(_ call: CAPPluginCall) {
        scanCallbackId = call.callbackId
        DispatchQueue.main.async {
            self.roomCaptureViewController = RoomCaptureViewController()
            self.roomCaptureViewController?.scanPluginDelegate = self
            if let viewController = self.bridge?.viewController {
                viewController.present(self.roomCaptureViewController!, animated: true, completion: {
                    call.resolve()
                })
            } else {
                call.reject("Unable to present RoomCaptureViewController")
            }
        }
    }

    func onDelegateCall(_ controller: RoomCaptureViewController, didFinishWithResult result: String) {
        if let callbackId = scanCallbackId {
             if let savedCall = self.bridge?.savedCall(withID: callbackId) {
                savedCall.resolve([
                    "result": result
                ])
            }
        }
    }
}
