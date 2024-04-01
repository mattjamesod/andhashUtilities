import Foundation

/// Makes the negative sign commute with optionality
/// -Optional(5) = Optional(-5)
public extension Optional where Wrapped: Numeric {
    static prefix func -(rhs: Self) -> Wrapped? {
    switch rhs {
    case .some(let value):
        return value * -1
    case .none:
        return nil
        }
    }
}
