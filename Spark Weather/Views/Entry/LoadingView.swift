import SwiftUI

struct LoadingView: View {
    var body: some View {
        ZStack {
            GradientBackground()
            ProgressView()
        }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
