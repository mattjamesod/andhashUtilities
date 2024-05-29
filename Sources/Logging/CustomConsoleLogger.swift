import Foundation

public protocol CustomConsoleLogger {
    var logToConsole: Bool { get }
    func log(_ msg: String)
}

public extension CustomConsoleLogger {
    func log(_ msg: String) {
        if logToConsole { print("\(UUID().uuidString.prefix(8)) - \(msg)") }
    }
}
