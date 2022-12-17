//
//  ContentView.swift
//  Pinch
//
//  Created by Jake Choi on 12/16/22.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: - PROPERTY
    
    // This mutable variable will store the actual state of the animation and trigger whenever
    @State private var isAnimating: Bool = false
    
    // Default value of imagescale is 1
    // Each time when users double tap on the image
    @State private var imageScale: CGFloat = 1
    
    // Mutable property to store offset value
    // Initial width and height of the image offset are zero
    // Will ask to update and store the new offset value of property
    @State private var imageOffset: CGSize = CGSize(width: 0, height: 0)
    
    // MARK: - FUNCTION
    
    func resetImageState() {
        return withAnimation(.spring()) {
            imageScale = 1
            imageOffset = .zero
        }
    }
    
    // MARK: - CONTENT
    
    
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
                    .opacity(isAnimating ? 1 : 0)
                    .offset(x: imageOffset.width, y: imageOffset.height)
                    .scaleEffect(imageScale)
                
                // MARK: - 1. Tap Gesture
                    .onTapGesture(count: 2, perform: {
                        if imageScale == 1 {
                            withAnimation(.spring()) {
                                imageScale = 5
                            }
                        } else {
                            resetImageState()
                        }
                    })
                // MARK: - 2. Drag Gesture
                
                // To mutate the imageOffset property when the gesture value changes.
                // This value stores and returns the total translation from the
                // start of the drag gesture to the current event of the DragGesture
                // Main action is to update the imageOffset width and height values
                // With the gesture width and heigth transition.
                    .gesture(DragGesture()
                        .onChanged { value in
                            withAnimation(.linear(duration: 1)) {
                                imageOffset = value.translation
                            }
                        }
                // Back to the cover image each time when it scale value is <= 1
                // Reset image to its original position and size each time
                        .onEnded { _ in
                            if imageScale <= 1 {
                                resetImageState()
                            }
                        }
                    )
                    
            } //: ZSTACK
            .navigationTitle("Pinch & Zoon")
            .navigationBarTitleDisplayMode(.inline)
            .onAppear(perform: {
                withAnimation(.linear(duration: 1)) {
                    isAnimating = true
                }
            })
            
        } //: NAVIGATION
    }
}

// MARK: - PREVIEW

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}
