import SwiftUI

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

