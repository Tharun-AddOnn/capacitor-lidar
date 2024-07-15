import XCTest
@testable import LidarPlugin

class LidarTests: XCTestCase {
    fun testIsLidarAvailable(){
        let implementation = Lidar();
        let result = implementation.isLiDARAvailable();
        XCTAssertEqual(result);
    }
}
