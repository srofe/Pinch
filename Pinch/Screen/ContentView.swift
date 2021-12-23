//
//  ContentView.swift
//  Pinch
//
//  Created by Simon Rofe on 23/12/2021.
//

import SwiftUI

struct ContentView: View {
    @State private var isAnimating: Bool = false
    @State private var imageScale: CGFloat = 1
    @State private var imageOffset: CGSize = .zero

    var body: some View {
        NavigationView {
            ZStack {
                Image("magazine-front-cover")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .cornerRadius(10)
                .shadow(color: .black.opacity(0.2), radius: 12, x: 2, y: 2)
                .opacity(isAnimating ? 1 : 0)
                .offset(x: imageOffset.width, y: imageOffset.height)
                .scaleEffect(imageScale)
                .onTapGesture(count: 2) {
                    if imageScale == 1 {
                        withAnimation(.spring()) {
                            imageScale = 5
                        }
                    } else {
                        withAnimation(.spring()) {
                            imageScale = 1
                        }
                    }
                }
                .gesture(
                    DragGesture()
                        .onChanged { value in
                            withAnimation(.linear(duration: 1)) {
                                imageOffset = value.translation
                            }
                        }
                )
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
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
