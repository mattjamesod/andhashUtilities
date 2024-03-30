import XCTest
@testable import Extensions

final class ComparableTests: XCTestCase {
    let closedRange = 1...3
    let start = 1
    let contained = 2
    let end = 3
    
    func testItemInRangeIsIdentity() throws {
        XCTAssertEqual(contained.clamped(to: closedRange), contained)
    }
    
    func testItemAtStartBoundaryIsIdentity() throws {
        XCTAssertEqual(start.clamped(to: closedRange), start)
    }
    
    func testItemBeforeStartBoundaryIsStart() throws {
        let beforeStart = start - 1
        XCTAssertEqual(beforeStart.clamped(to: closedRange), start)
    }
    
    func testItemAtEndBoundaryIsIdentity() throws {
        XCTAssertEqual(end.clamped(to: closedRange), end)
    }
    
    func testItemAfterEndBoundaryIsEnd() throws {
        let afterEnd = end + 1
        XCTAssertEqual(afterEnd.clamped(to: closedRange), end)
    }
    
    func testNonMutuableClampDoesNotMutate() throws {
        let beforeStart = start - 1
        let clamped = beforeStart.clamped(to: closedRange)
        
        XCTAssertEqual(beforeStart, start - 1)
        XCTAssertEqual(clamped, start)
    }
    
    func testMutuableClampMutates() throws {
        var beforeStart = start - 1
        beforeStart.clamp(to: closedRange)
        
        XCTAssertEqual(beforeStart, start)
    }
}
