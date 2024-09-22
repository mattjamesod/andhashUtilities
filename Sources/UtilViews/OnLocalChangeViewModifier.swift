import SwiftUI

/// For State management. Takes two values, one of which can only be changed by the parent calling
/// view `internalValue`, and one which can be affected by the surrounding program environment
/// `externalValue`.
///
/// `.onLocalChange` ensures that a callback is fires when the internal value is changed
/// by it's owner, AND that the internal value stays in sync with the external value, without triggering the
/// callback.
///
/// This seems esoteric, but is extremely useful when forced to have two sources of truth, i.e. a TextField
/// should mirror the local database value, but also needs to depend on a local @State variable

struct OnLocalChangeViewModifier<T: Equatable>: ViewModifier {
    @Binding var internalValue: T
    let externalValue: T
    let initial: Bool
    let callback: () -> Void
    
    @State private var ignoreUpdate: Bool = false
    
    init(internalValue: Binding<T>, externalValue: T, initial: Bool, callback: @escaping () -> Void) {
        self._internalValue = internalValue
        self.externalValue = externalValue
        self.initial = initial
        self.callback = callback
    }
    
    func body(content: Content) -> some View {
        content
            .onChange(of: internalValue) {
                guard self.permit() else { return }
                
                callback()
            }
            .onChange(of: externalValue, initial: self.initial) {
                self.pushOutsideChange(externalValue)
            }
    }
    
    private func pushOutsideChange(_ maybeChanged: T) {
        // this check is neccesary because assinging a value to its current
        // value does not trigger onChange callbacks
        guard internalValue != maybeChanged else { return }
        
        ignoreUpdate = true
        internalValue = maybeChanged
    }
    
    private func permit() -> Bool {
        if ignoreUpdate {
            ignoreUpdate = false
            return false
        }
        else {
            return true
        }
    }
}

public extension View {
    func onLocalChange<T: Equatable>(of internalValue: Binding<T>, source externalValue: T, setupFromSource: Bool = false, callback: @escaping () -> Void) -> some View {
        self.modifier(OnLocalChangeViewModifier(internalValue: internalValue, externalValue: externalValue, initial: setupFromSource, callback: callback))
    }
}

