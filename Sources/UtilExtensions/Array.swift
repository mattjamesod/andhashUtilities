
public extension Array {
    func compact<T>() -> [T] where Element == Optional<T> {
        self.compactMap { $0 }
    }
    
    func sortByFrequency() -> [Element] where Element: Comparable & Hashable {
        let occurencesDict = self.reduce(into: [Element: Int](), { currentResult, element in
            currentResult[element, default: 0] += 1
        })
        
        return self.sorted(by: { current, next in
            occurencesDict[current]! > occurencesDict[next]!
        })
    }
}
