import SwiftUI

/// Creates a scroll view where the content will be centered if it does not fill the screen
///
/// deafultScrollAnchor behaves incorrectly with the scrollTransition method,
/// and thinks the top of the scroll view is where the content ends, not the
/// top of the scroll view as determined by the border method...

public struct CenteredScrollView<Content: View>: View {
    let contentBuilder: () -> Content
    
    public init(_ contentBuilder: @escaping () -> Content) {
        self.contentBuilder = contentBuilder
    }
    
    public var body: some View {
        GeometryReader { proxy in
            ScrollView {
                contentBuilder()
                    .frame(minHeight: proxy.size.height)
            }
        }
    }
}
