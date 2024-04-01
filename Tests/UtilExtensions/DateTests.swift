import XCTest
import SwiftUI
@testable import UtilExtensions

final class DateTests: XCTestCase {
    var testDate: Date {
        var components = DateComponents()
        components.year = 2011
        components.month = 11
        components.day = 11
        components.hour = 11
        components.minute = 11
        
        return Calendar.current.date(from: components)!
    }
    
    func testDayName() {
        XCTAssertEqual(testDate.dayName, "Friday")
    }
    
    func testMonthName() {
        XCTAssertEqual(testDate.monthName, "November")
    }
}
