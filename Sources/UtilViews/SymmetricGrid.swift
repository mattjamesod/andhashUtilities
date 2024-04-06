import SwiftUI

public struct SymmetricGrid<Data: Identifiable, DataView: View>: View {
    let data: [Data]
    
    let width: Int
    let length: Int
    private var count: Int { data.count }
    
    let callback: ((Data) -> (DataView))
    
    public init(data: [Data], width: Int, length: Int, callback: @escaping ((Data) -> (DataView))) {
        self.data = data
        self.width = width
        self.length = length
        self.callback = callback
    }
    
    public var body: some View {
        Grid {
            ForEach(Array(stride(from: width, through: count, by: width)), id: \.self) { n in
                GridRow {
                    ForEach(self.data[(n - width)..<n]) { datum in
                        callback(datum)
                    }
                }
            }
        }
    }
}
