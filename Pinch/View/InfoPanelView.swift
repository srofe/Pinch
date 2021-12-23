//
//  InfoPanelView.swift
//  Pinch
//
//  Created by Simon Rofe on 23/12/2021.
//

import SwiftUI

struct InfoPanelView: View {
    var body: some View {
        HStack {
            Image(systemName: "circle.circle")
                .symbolRenderingMode(.hierarchical)
                .resizable()
                .frame(width: 30, height: 30)
        }
    }
}

struct InfoPanelView_Previews: PreviewProvider {
    static var previews: some View {
        InfoPanelView()
            .preferredColorScheme(.dark)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
