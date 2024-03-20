//
//  GeminiVM.swift
//  GeminiStandalone
//
//  Created by Omari on 3/20/24.
//

import GoogleGenerativeAI
import SwiftUI

enum GeminiError: Error {
    case failedToSend
}

struct GeminiVM {
    let model = GenerativeModel(name: "gemini-pro", apiKey: GeminiKey.default)
    
    @State var prompt = ""
    @State var response = ""
    @State var chatHistory: [ModelContent] = []
    
    func generate(str: String) async -> String {
        // basic approach
        let response = try? await model.generateContent(str)
        if let text = response?.text {
            print(text)
            return text
        }
        
        return ""
    }
    
    func generateWithHistory(str: String) async throws -> String {
        chatHistory.append(ModelContent(role: "user", parts: str))
        
        // chat history
        let chat = model.startChat(history: chatHistory)
        guard let response = try? await chat.sendMessage(str) else {
            throw GeminiError.failedToSend
        }
        
        if let text = response.text {
            print(text)
            return text
        }
        
        return ""
    }
}
