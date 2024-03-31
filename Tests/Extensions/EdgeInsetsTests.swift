import XCTest
import SwiftUI
@testable import Extensions

final class EdgeInsetsTests: XCTestCase {
    let horizontal: Double = 12
    let vertical: Double = 8
    let insets = EdgeInsets(vertical: 8, horizontal: 12)
    
    func testVerticalHorizonalInitialiser() {
        XCTAssertEqual(insets.top, vertical)
        XCTAssertEqual(insets.bottom, vertical)
        XCTAssertEqual(insets.leading, horizontal)
        XCTAssertEqual(insets.trailing, horizontal)
    }
    
    func testHorizontalTotalHelper() {
        XCTAssertEqual(insets.horizontalTotal, horizontal * 2)
    }
    
    func testVerticallTotalHelper() {
        XCTAssertEqual(insets.verticalTotal, vertical * 2)
    }
}
