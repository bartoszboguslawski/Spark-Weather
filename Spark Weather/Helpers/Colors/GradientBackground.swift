import SwiftUI

struct GradientBackground: View {
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [
            Color.theme.background1,
            Color.theme.background2]),
            startPoint: .topLeading,
            endPoint: .bottomTrailing)
        .ignoresSafeArea()
    }
}

struct GradientBackground_Previews: PreviewProvider {
    static var previews: some View {
        GradientBackground()
    }
}
