//
//  ContentView.swift
//  Pinch
//
//  Created by Simon Rofe on 23/12/2021.
//

import SwiftUI

struct ContentView: View {
    @State private var isAnimating: Bool = false
    var body: some View {
        NavigationView {
            ZStack {
                Image("magazine-front-cover")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .cornerRadius(10)
                .shadow(color: .black.opacity(0.2), radius: 12, x: 2, y: 2)
                .opacity(isAnimating ? 1 : 0)
            }
            .navigationBarTitle("Pinch & Zoom")
            .navigationBarTitleDisplayMode(.inline)
            .onAppear(perform: {
                withAnimation(.linear(duration: 1)) {
                    isAnimating = true
                }
            })
        }
        .navigationViewStyle(.stack)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
