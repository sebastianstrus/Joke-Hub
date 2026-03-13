//
//  OnboardingView.swift
//  Joke Hub
//
//  Created by Sebastian Strus on 3/13/26.
//

import SwiftUI

struct OnboardingView: View {
    @Binding var hasSeenOnboarding: Bool
    @State private var currentPage = 0

    private let pages: [OnboardingPage] = [
        OnboardingPage(
            emoji: "🎭",
            title: "Daily Laughs",
            description: "A fresh joke whenever you need one. Swipe through categories and never run out of material.",
            accentColor: .indigo
        ),
        OnboardingPage(
            emoji: "🗂️",
            title: "Browse by Category",
            description: "From dad jokes to tech humor — pick your vibe or shuffle for a surprise.",
            accentColor: .purple
        ),
        OnboardingPage(
            emoji: "❤️",
            title: "Save Your Favorites",
            description: "Heart the jokes that land. Revisit them anytime in your Favorites tab.",
            accentColor: .red
        ),
        OnboardingPage(
            emoji: "📤",
            title: "Share the Laughter",
            description: "Spread the joy — share any joke with friends in one tap.",
            accentColor: Color(red: 0.2, green: 0.7, blue: 0.5)
        )
    ]

    var body: some View {
        ZStack {
            // Matches ContentView background exactly
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

            VStack(spacing: 0) {
                // Skip button
                HStack {
                    Spacer()
                    Button("Skip") {
                        finish()
                    }
                    .font(.subheadline)
                    .foregroundStyle(.white.opacity(0.45))
                    .padding(.horizontal, 24)
                    .padding(.top, 16)
                }

                // Pages
                TabView(selection: $currentPage) {
                    ForEach(pages.indices, id: \.self) { index in
                        OnboardingPageView(page: pages[index])
                            .tag(index)
                    }
                }
                .tabViewStyle(.page(indexDisplayMode: .never))
                .animation(.spring(response: 0.4), value: currentPage)

                // Page dots
                HStack(spacing: 8) {
                    ForEach(pages.indices, id: \.self) { index in
                        Capsule()
                            .fill(currentPage == index ? Color.white : Color.white.opacity(0.3))
                            .frame(width: currentPage == index ? 20 : 8, height: 8)
                            .animation(.spring(response: 0.3), value: currentPage)
                    }
                }
                .padding(.bottom, 32)

                // Next / Get Started button
                Button(action: advance) {
                    Text(currentPage == pages.count - 1 ? "Get Started 🎉" : "Next")
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundStyle(.white)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 16)
                        .background(
                            LinearGradient(
                                colors: [Color.indigo, Color.purple],
                                startPoint: .leading,
                                endPoint: .trailing
                            )
                        )
                        .clipShape(RoundedRectangle(cornerRadius: 18))
                        .shadow(color: Color.indigo.opacity(0.5), radius: 16, y: 8)
                }
                .padding(.horizontal, 20)
                .padding(.bottom, 40)
            }
        }
    }

    func advance() {
        if currentPage < pages.count - 1 {
            withAnimation { currentPage += 1 }
        } else {
            finish()
        }
    }

    func finish() {
        withAnimation { hasSeenOnboarding = true }
    }
}

