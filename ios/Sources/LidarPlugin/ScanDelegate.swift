import UIKit
@available(iOS 16.0, *)
protocol ScanDelegate: AnyObject { // Use AnyObject for class-only protocols
    func onDelegateCall(_ controller: RoomCaptureViewController, didFinishWithResult result: String)
}