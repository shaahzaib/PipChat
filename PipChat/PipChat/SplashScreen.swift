import SwiftUI

struct SplashScreen: View {
    @State private var animate = false
    @State private var showChat = false
    
    var body: some View {
        ZStack {
            if showChat {
                HomeView()
                    .preferredColorScheme(.dark)
            } else {
                ZStack {
                    LinearGradient(
                        colors: [Color.blue, Color.teal],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                    .ignoresSafeArea()
                    
                    VStack(spacing: 20) {
                        // Logo
                        Image(systemName: "message.circle.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 120, height: 120)
                            .foregroundStyle(.white)
                            .scaleEffect(animate ? 1.0 : 0.5)
                            .rotationEffect(.degrees(animate ? 360 : 0))
                            .shadow(radius: 10)
                        
                        // App Name
                        Text("PipChat")
                            .font(.system(size: 36, weight: .bold, design: .rounded))
                            .foregroundColor(.white)
                            .opacity(animate ? 1 : 0)
                            .offset(y: animate ? 0 : 20)
                    }
                }
                .onAppear {
                    withAnimation(.easeInOut(duration: 1.5)) {
                        animate = true
                    }
                    
                    // Navigate to main chat after delay
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                        withAnimation {
                            showChat = true
                        }
                    }
                }
            }
        }
    }
}

struct SplashScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreen()
    }
}
