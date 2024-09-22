import SwiftUI

/// Just draw a grid FFS

public struct SimpleGrid<Data: Identifiable, DataView: View>: View {
    let data: [Data]
    let width: Int
    let callback: ((Data) -> (DataView))
    
    public init(data: [Data], width: Int, callback: @escaping ((Data) -> (DataView))) {
        self.data = data
        self.width = width
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
            
            GridRow {
                ForEach(self.raggedRow) { datum in
                    callback(datum)
                    callback(datum).opacity(0)
                }
            }
        }
    }
    
    private var count: Int { 
        data.count
    }
    
    // Leftover items which don't make a full row by themselves
    private var raggedRow: [Data] {
        Array(data[count - (count % width)..<count])
        
        // 1 - (1 % 2)..<1
    }
}
