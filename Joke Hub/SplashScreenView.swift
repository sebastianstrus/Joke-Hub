//
//  SplashScreenView.swift
//  Joke Hub
//
//  Created by Sebastian Strus on 3/13/26.
//

import SwiftUI

struct SplashScreenView: View {
    @State private var scale: CGFloat = 0.7
    @State private var opacity: Double = 0
    @State private var emojiOffset: CGFloat = 20

    var body: some View {
        ZStack {
            LinearGradient(
                colors: [
                    Color(red: 0.06, green: 0.13, blue: 0.15),
                    Color(red: 0.13, green: 0.23, blue: 0.26),
                    Color(red: 0.17, green: 0.33, blue: 0.39)
                ],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()

            VStack(spacing: 16) {
                Text("😂")
                    .font(.system(size: 80))
                    .offset(y: emojiOffset)

                Text("Joke Hub")
                    .font(.system(size: 38, weight: .bold, design: .rounded))
                    .foregroundStyle(.white)

                Text("Your pocket comedian")
                    .font(.subheadline)
                    .foregroundStyle(.white.opacity(0.5))
                    .kerning(1.5)
                    .textCase(.uppercase)
            }
            .scaleEffect(scale)
            .opacity(opacity)
            .onAppear {
                withAnimation(.spring(response: 0.6, dampingFraction: 0.65)) {
                    scale = 1.0
                    opacity = 1
                    emojiOffset = 0
                }
            }
        }
    }
}
