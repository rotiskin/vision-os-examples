//
//  GeminiView.swift
//  GeminiStandalone
//
//  Created by Omari on 3/20/24.
//

import SwiftUI

struct GeminiView: View {
    var gemini = GeminiVM()
    @State var promptField: String = ""
    @State var lastResult = ""
    
    var body: some View {
        Text("GEMINI")
        TextField("prompt-field", text: $promptField)
            .onChange(of: gemini.prompt, {
                
            })
        Button("Send Prompt") {
            Task {
                lastResult = "loading..."
                print("a task where we re-call generate")
                let result = await gemini.generate(str: $promptField.wrappedValue)
                lastResult = result
            }
        }
        ScrollView {
            $lastResult.wrappedValue != "" ? Text(LocalizedStringKey($lastResult.wrappedValue)) : nil
        }
    }
}

#Preview {
    GeminiView()
}
