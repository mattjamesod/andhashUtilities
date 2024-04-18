import Foundation

public extension String {
    func truncated(limit: Int) -> String {
        self.count > limit ? String(prefix(limit)) : self
    }
    
    mutating func truncate(limit: Int) {
        if self.count > limit {
            self = String(prefix(limit))
        }
    }
}
