import SwiftUI

struct GradientBackground2: View {
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [
            Color.theme.background1,
            Color.theme.background2]),
            startPoint: .bottomTrailing,
            endPoint: .topLeading)
        .ignoresSafeArea()
    }
}

struct GradientBackground2_Previews: PreviewProvider {
    static var previews: some View {
        GradientBackground2()
    }
}
