//
//  ContentView.swift
//  Pinch
//
//  Created by Jake Choi on 12/16/22.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: - PROPERTY
    
    @State private var isAnimating: Bool = false
    
    // MARK: - BODY
    
    var body: some View {
        NavigationStack {
            ZStack {
                // MARK: - Page Image
                Image("magazine-front-cover")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(10)
                    .padding()
                    .shadow(color: .black.opacity(0.2), radius: 12, x: 2, y: 2)
                            
                
            } //: ZSTACK
            .navigationTitle("Pinch & Zoon")
            .navigationBarTitleDisplayMode(.inline)
        } //: NAVIGATION
    }
}

// MARK: - PREVIEW

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
