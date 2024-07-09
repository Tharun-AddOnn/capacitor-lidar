import Foundation

@objc public class Lidar: NSObject {
    @objc public func echo(_ value: String) -> String {
        print(value)
        return value
    }
}
