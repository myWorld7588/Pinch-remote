//
//  infoPanelView.swift
//  Pinch
//
//  Created by Jake Choi on 12/17/22.
//

import SwiftUI

struct infoPanelView: View {
    // Create two properties to store the image scale and offset values
    var scale: CGFloat
    var offset: CGSize
    
    // Add Feature to show and hide the info panel by creating new immutable variable that will store the actual state info panel
    // Hide the info panel by default
    @State private var isInfoPanelVisible: Bool = false

    var body: some View {
        HStack {
            // MARK: - Hotspot
            Image(systemName: "circle.circle")
                .symbolRenderingMode(.hierarchical)
                .resizable()
                .frame(width: 30, height: 30)
            
            // Inside the .onLongPressGesture() modifier, toggle the value from true to false and back depending on the actual state.
                .onLongPressGesture(minimumDuration: 1) {
                    withAnimation(.easeOut) {
                        isInfoPanelVisible.toggle()
                    }
                }
            
            Spacer()
            
            HStack(spacing: 2) {
                Image(systemName: "arrow.up.left.and.arrow.down.right")
                Text("\(scale)")
                
                Spacer()
                
                Image(systemName: "arrow.left.and.right")
                Text("\(offset.width)")
                
                Spacer()
                
                Image(systemName: "arrow.up.and.down")
                Text("\(offset.height)")
                
                Spacer()
            }
            .font(.footnote)
            .padding(8)
            .background(.ultraThinMaterial)
            .cornerRadius(8)
            .frame(maxWidth: 420)

            //Make the info panel either visible or hidden depending on the actual state of the property
            .opacity(isInfoPanelVisible ? 1 : 0)
            
            Spacer()
        }
    }
}

struct infoPanelView_Previews: PreviewProvider {
    static var previews: some View {
        infoPanelView(scale: 1, offset: .zero)
            .preferredColorScheme(.dark)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}

