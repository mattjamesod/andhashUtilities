import SwiftUI

public extension Color {
    func isDarkBackground(in environment: EnvironmentValues) -> Bool {
        let rgb = self.resolve(in: environment)
        
        let brightness = sqrt(
            (rgb.red * rgb.red * 0.241) +
            (rgb.green * rgb.green * 0.691) +
            (rgb.blue * rgb.blue * 0.068)
        )
        
        return brightness < 0.55
    }
}
