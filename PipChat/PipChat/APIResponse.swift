//
//  APIResponse.swift
//  PipChat
//
//  Created by Macbook Pro on 16/09/2025.
//

import Foundation
import SwiftUI

extension  HomeView{
    func generateResponse(){
        isGeneratingResponse = true
        AiResponse = ""
        
        Task{
            do{
                let result = try await model.generateContent(userPrompt)
                isGeneratingResponse = false
                AiResponse = LocalizedStringKey(result.text ?? "No response found!")
                userPrompt = ""
            }catch{
                AiResponse = "Something went wrong \n \(error.localizedDescription)"
                isGeneratingResponse = false
            }
        }
    }
}
