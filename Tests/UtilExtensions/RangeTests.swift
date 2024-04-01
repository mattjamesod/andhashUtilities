import XCTest
import SwiftUI
@testable import UtilExtensions

final class RangeTests: XCTestCase {
    func testIndifferentOrdering() {
        let range1 = Range.withIndifferentOrdering(-1, 5)
        let range2 = Range.withIndifferentOrdering(5, -1)
        
        XCTAssertEqual(range1, range2)
    }
    
    func testIndifferentOrderingEmpty() {
        XCTAssertTrue(Range.withIndifferentOrdering(1, 1).isEmpty)
    }
    
    func testClosedIndifferentOrdering() {
        let range1 = ClosedRange.withIndifferentOrdering(-1, 5)
        let range2 = ClosedRange.withIndifferentOrdering(5, -1)
        
        XCTAssertEqual(range1, range2)
    }
}
