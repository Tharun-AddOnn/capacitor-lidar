import UIKit
import Capacitor

@available(iOS 16.0, *)

class MyViewController: CAPBridgeViewController {
    override open func capacitorDidLoad() {
        bridge?.registerPluginInstance(LidarPlugin())
    }
}