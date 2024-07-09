import Foundation
import Capacitor
import ARKit
import RoomPlan
import UIKit

@available(iOS 16.0, *)
@objc(LidarPlugin)
public class LidarPlugin: CAPPlugin, ScanDelegate {
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
            notifyListeners("onScanResult", data: [
                "result": result
            ])
            bridge?.saveCallResult(CAPPluginCallResult(json: ["result": result]), forCallbackId: callbackId)
        }
    }
}
