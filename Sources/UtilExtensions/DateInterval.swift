import Foundation

public extension DateInterval {
    init?(start: Date?, duration: TimeInterval?) {
        switch (start != nil, duration != nil) {
        case (true, true): self.init(start: start!, duration: duration!)
        case (true, _): self.init(start: start!, duration: .zero)
        default: return nil
        }
    }
    
    init?(start: Date?, end: Date?) {
        if start != nil && end != nil && end! >= start! {
            self.init(start: start!, duration: .zero)
        }
        
        switch (start != nil, end != nil) {
        case (true, true): self.init(start: start!, end: end!)
        case (true, _): self.init(start: start!, duration: .zero)
        case (_, true): self.init(start: end!, duration: .zero)
        default: return nil
        }
    }
}
