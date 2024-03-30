import XCTest
@testable import Extensions

final class ArrayTests: XCTestCase {
    func testCompactRemovesNilItems() {
        let arr: [String?] = ["hello", nil, "world"]
        let compactedArr = ["hello", "world"]
        
        XCTAssertEqual(arr.compact(), compactedArr)
    }
    
    func testSortByFrequency() {
        let arr: [Int] = [1, 2, 1, 2, 3, 1]
        
        XCTAssertEqual(arr.sortByFrequency(), [1, 1, 1, 2, 2, 3])
    }
}


