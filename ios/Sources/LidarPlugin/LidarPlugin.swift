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
    func onDelegateCall(_ controller: RoomCaptureViewController, didFinishWithResult result: String) {
        currentCall?.resolve(["result": result])
    }
    public let identifier = "LidarPlugin"
    public let jsName = "Lidar"
    public let pluginMethods: [CAPPluginMethod] = [
        CAPPluginMethod(name: "isLiDARAvailable", returnType: CAPPluginReturnPromise),
        CAPPluginMethod(name: "startScan", returnType: CAPPluginReturnPromise)
    ]
    //private let implementation = Lidar()

    private var roomCaptureViewController: RoomCaptureViewController?
    private var scanCallbackId: String?
    private var currentCall : CAPPluginCall?
    public override func load() {
        self.scanCallbackId = nil
        self.currentCall = nil
    }
  
    @objc func isLiDARAvailable(_ call: CAPPluginCall) {
        let available = ARWorldTrackingConfiguration.supportsSceneReconstruction(.mesh)
        call.resolve([
            "available": available
        ])
    }

    @objc func startScan(_ call: CAPPluginCall) {
        scanCallbackId = call.callbackId
        currentCall = call
        DispatchQueue.main.async {
            if let rootViewController = self.bridge?.viewController {
                let storyboard = UIStoryboard(name: "RoomCaptureViewController", bundle: Bundle(for: type(of: self)))
                if let viewController = storyboard.instantiateViewController(withIdentifier: "RoomCaptureViewController") as? RoomCaptureViewController {
                    viewController.scanPluginDelegate = self
                    let customNavigationController = RoomCaptureViewNavigationController(rootViewController: viewController)
                    customNavigationController.modalPresentationStyle = .fullScreen
                    rootViewController.present(customNavigationController, animated: true, completion: {
                        //call.resolve()
                    })
                } else {
                    call.reject("Unable to instantiate RoomCaptureViewController from storyboard")
                }
            } else {
                call.reject("Unable to access root view controller")
            }
        }
    }
}
