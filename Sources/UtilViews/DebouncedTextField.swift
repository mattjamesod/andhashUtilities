import SwiftUI
import AsyncAlgorithms

/// Creates a text field which only updates the bound value after debouncing for the given `wait` duration
/// Useful when triggering expensive callbacks on change

public struct DebouncedTextField: View {
    @State var channel: AsyncChannel<String> = .init()
    
    @Binding var outerText: String
    @State var innerText: String
        
    let label: String
    let wait: Duration
    
    public init(_ label: String, text: Binding<String>, wait: Duration = .seconds(0.7)) {
        self.innerText = .init(text.wrappedValue)
        self._outerText = text
        
        self.label = label
        self.wait = wait
    }
    
    public var body: some View {
        TextField(label, text: $innerText, axis: .vertical)
            .onLocalChange(of: $innerText, source: outerText) {
                // onChange may execute on the main thread
                Task.detached {
                    await channel.send(innerText)
                }
            }
            .task {
                for await value in channel.debounce(for: self.wait) {
                    outerText = value
                }
            }
    }
}
