//
//  HomeView.swift
//  PipChat
//
//  Created by Macbook Pro on 16/09/2025.
//

import SwiftUI
import GoogleGenerativeAI

struct HomeView: View {
    let model = GenerativeModel(name: "gemini-2.0-flash", apiKey: APIKeyService.default)
    
    @State var userPrompt :  String = ""
    @State var AiResponse : LocalizedStringKey = "How can I help you  today?"
    @State var isGeneratingResponse :  Bool = false
    
    var body: some View {
        VStack{
            HStack {
                Text("Welcome to PipChat AI")
                    .font(.system(size: 32))
                    .fontWeight(.bold)
                    .padding(.top, 40)
                Image(systemName: "sparkles")
            }
            .foregroundStyle( LinearGradient(
                colors: [Color.blue, Color.teal],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            ))
            
            ZStack {
                ScrollView {
                    Text(AiResponse)
                        .font(.title2)
                }
                
                if isGeneratingResponse{
                    ProgressView()
                        .progressViewStyle(.circular)
                        .scaleEffect(2)
                        .tint(LinearGradient(
                            colors: [Color.blue, Color.teal],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        ))
                }
            }
            
            TextField("Ask anything...", text: $userPrompt, axis: .vertical)
                .lineLimit(5)
                .font(.title2)
                .tint(.gray.opacity(0.2))
                .padding()
                .background(Color.gray.opacity(0.2), in: Capsule())
                .disableAutocorrection(true)
                .onSubmit {
                    generateResponse()
                }
        }
        .padding()
    }
}

#Preview {
    HomeView()
        .preferredColorScheme(.dark)
}
