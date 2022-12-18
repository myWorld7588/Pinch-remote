//
//  infoPanelView.swift
//  Pinch
//
//  Created by Jake Choi on 12/17/22.
//

import SwiftUI

struct infoPanelView: View {
    var scale: CGFloat
    var offset: CGSize

    var body: some View {
        HStack {
            // MARK: - Hotspot
            Image(systemName: "circle.circle")
                .symbolRenderingMode(.hierarchical)
                .resizable()
                .frame(width: 30, height: 30)
            
            Spacer()
            
            
            // MARK: - Info Panel
            HStack {
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
            .frame(minWidth: 420)
            
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
