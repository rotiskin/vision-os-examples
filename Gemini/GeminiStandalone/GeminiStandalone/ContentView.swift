//
//  ContentView.swift
//  GeminiStandalone
//
//  Created by Omari on 3/20/24.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ContentView: View {
    var body: some View {
        VStack {
            Model3D(named: "Scene", bundle: realityKitContentBundle)
                .padding(.bottom, 50)
            GeminiView()
        }
        .padding()
    }
}

#Preview(windowStyle: .automatic) {
    ContentView()
}
