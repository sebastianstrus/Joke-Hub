//
//  ContentView.swift
//  Joke Hub
//
//  Created by Sebastian Strus on 3/12/26.
//

import SwiftUI



// MARK: - Joke Provider


// MARK: - Content View
struct ContentView: View {
    @State private var currentJoke: Joke = JokeProvider.jokes.randomElement()!
    @State private var isAnimating = false
    @State private var showPunchline = false
    @State private var selectedCategory: JokeCategory = .all
    @State private var likedJokes: Set<UUID> = []
    @State private var jokeCount = 1
    @State private var cardOffset: CGFloat = 0
    @State private var cardOpacity: Double = 1
    @State private var heartBounce = false
    
    @State private var dealOffset: CGSize = .zero
    @State private var dealRotation: Double = 0
    @State private var dealOpacity: Double = 1

    // Background color components — used to match the fade overlay exactly
    private let bgR = 0.06
    private let bgG = 0.13
    private let bgB = 0.15

    var body: some View {
        ZStack {
            LinearGradient(
                colors: [
                    Color(red: bgR, green: bgG, blue: bgB),
                    Color(red: 0.13, green: 0.23, blue: 0.26),
                    Color(red: 0.17, green: 0.33, blue: 0.39)
                ],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()

            VStack(spacing: 0) {

                // MARK: Header
                HStack {
                    VStack(alignment: .leading, spacing: 2) {
                        Text("Joke Hub")
                            .font(.system(size: 28, weight: .bold, design: .rounded))
                            .foregroundStyle(.white)
                        Text("Your pocket comedian")
                            .font(.caption)
                            .foregroundStyle(.white.opacity(0.45))
                            .kerning(1.5)
                            .textCase(.uppercase)
                    }
                    Spacer()
                    Button(action: shareJoke) {
                        Image(systemName: "square.and.arrow.up")
                            .font(.system(size: 14, weight: .semibold))
                            .foregroundStyle(.white.opacity(0.7))
                            .frame(width: 36, height: 36)
                            .background(.white.opacity(0.12))
                            .clipShape(Circle())
                    }
                }
                .padding(.horizontal, 24)
                .padding(.top, 16)
                .padding(.bottom, 20)

                // MARK: Category Tabs with scroll-fade affordance
                ZStack(alignment: .trailing) {
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 8) {
                            ForEach(JokeCategory.allCases, id: \.self) { category in
                                CategoryTab(
                                    category: category,
                                    isSelected: selectedCategory == category,
                                    favoriteCount: category == .favorites ? likedJokes.count : nil
                                ) {
                                    withAnimation(.spring(response: 0.3)) {
                                        selectedCategory = category
                                    }
                                    loadJokeForCategory(category)
                                }
                            }
                        }
                        .padding(.leading, 24)
                        .padding(.trailing, 56) // extra right padding so last tab isn't hidden under fade
                        .padding(.vertical, 4)
                    }

                    // Fade + chevron — makes scrollability obvious
                    HStack(spacing: 0) {
                        LinearGradient(
                            colors: [.clear, Color(red: bgR, green: bgG, blue: bgB)],
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                        .frame(width: 40)

                        Color(red: bgR, green: bgG, blue: bgB)
                            .frame(width: 28)
                            .overlay(
                                Image(systemName: "chevron.right")
                                    .font(.system(size: 11, weight: .semibold))
                                    .foregroundStyle(.white.opacity(0.55))
                            )
                    }
                    .frame(height: 36)
                    .allowsHitTesting(false)
                }
                .padding(.bottom, 24)

                Spacer()

                // MARK: Joke counter + favorites indicator
                HStack {
                    Text("JOKE #\(jokeCount)")
                        .font(.caption2)
                        .fontWeight(.semibold)
                        .foregroundStyle(.white.opacity(0.4))
                        .kerning(1)
                    Spacer()
                    if likedJokes.contains(currentJoke.id) {
                        HStack(spacing: 4) {
                            Image(systemName: "heart.fill")
                                .font(.caption2)
                            Text("Saved to Favorites")
                                .font(.caption2)
                                .fontWeight(.semibold)
                        }
                        .foregroundStyle(.red.opacity(0.8))
                        .transition(.opacity.combined(with: .scale))
                    }
                }
                .padding(.horizontal, 24)
                .padding(.bottom, 8)
                .animation(.spring(response: 0.3), value: likedJokes.contains(currentJoke.id))

                // MARK: Joke Card
                JokeCard(
                    joke: currentJoke,
                    showPunchline: showPunchline,
                    isLiked: likedJokes.contains(currentJoke.id),
                    heartBounce: heartBounce,
                    onLike: toggleLike,
                    onTap: {
                        withAnimation(.spring(response: 0.4, dampingFraction: 0.7)) {
                            showPunchline = true
                        }
                    }
                )
                .offset(dealOffset)
                .rotationEffect(.degrees(dealRotation))
                .opacity(dealOpacity)
                .padding(.horizontal, 20)

                Spacer()

                // MARK: Buttons
                VStack(spacing: 12) {
                    Button(action: nextJoke) {
                        HStack(spacing: 8) {
                            Image(systemName: "sparkles")
                            Text("Next Joke")
                                .fontWeight(.semibold)
                        }
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
                    .scaleEffect(isAnimating ? 0.97 : 1)
                    .animation(.spring(response: 0.2), value: isAnimating)

                    Button(action: randomCategory) {
                        HStack(spacing: 6) {
                            Image(systemName: "shuffle")
                            Text("Random Category")
                        }
                        .font(.system(size: 14, weight: .medium))
                        .foregroundStyle(.white.opacity(0.75))
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 13)
                        .background(.white.opacity(0.1))
                        .clipShape(RoundedRectangle(cornerRadius: 14))
                        .overlay(
                            RoundedRectangle(cornerRadius: 14)
                                .stroke(.white.opacity(0.2), lineWidth: 1)
                        )
                    }
                }
                .padding(.horizontal, 20)
                .padding(.bottom, 36)
            }
        }
    }

    // MARK: - Actions


    func nextJoke() {
        guard !isAnimating else { return }
        isAnimating = true

        // Fly current card off to the top-left
        withAnimation(.easeIn(duration: 0.25)) {
            dealOffset = CGSize(width: -300, height: -100)
            dealRotation = -15
            dealOpacity = 0
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
            let pool = JokeProvider.jokes(for: selectedCategory, likedIDs: likedJokes)
            currentJoke = pool.filter { $0.id != currentJoke.id }.randomElement() ?? pool.randomElement()!
            showPunchline = false
            jokeCount += 1

            // Position new card off-screen bottom-right, rotated
            dealOffset = CGSize(width: 300, height: 200)
            dealRotation = 20
            dealOpacity = 0

            // Deal it in with a satisfying arc
            withAnimation(.spring(response: 0.5, dampingFraction: 0.7)) {
                dealOffset = .zero
                dealRotation = 0
                dealOpacity = 1
            }

            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                isAnimating = false
            }
        }
    }


    // Apply to JokeCard in body:

    func loadJokeForCategory(_ category: JokeCategory) {
        let pool = JokeProvider.jokes(for: category, likedIDs: likedJokes)
        guard !pool.isEmpty, !isAnimating else { return }
        isAnimating = true

        withAnimation(.easeInOut(duration: 0.2)) {
            cardOffset = -20
            cardOpacity = 0
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            currentJoke = pool.randomElement()!
            showPunchline = false
            jokeCount += 1
            cardOffset = 30
            withAnimation(.spring(response: 0.45, dampingFraction: 0.72)) {
                cardOffset = 0
                cardOpacity = 1
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.45) {
                isAnimating = false
            }
        }
    }

    func toggleLike() {
        let wasLiked = likedJokes.contains(currentJoke.id)
        withAnimation(.spring(response: 0.3, dampingFraction: 0.4)) {
            heartBounce = true
            if wasLiked {
                likedJokes.remove(currentJoke.id)
            } else {
                likedJokes.insert(currentJoke.id)
            }
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            heartBounce = false
        }

        // If un-hearting while in Favorites, auto-advance
        if wasLiked && selectedCategory == .favorites {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
                let remaining = JokeProvider.jokes(for: .favorites, likedIDs: likedJokes)
                if remaining.isEmpty {
                    withAnimation(.spring(response: 0.3)) { selectedCategory = .all }
                    loadJokeForCategory(.all)
                } else {
                    nextJoke()
                }
            }
        }
    }

    func randomCategory() {
        let browsable = JokeCategory.allCases.filter { $0 != selectedCategory && $0 != .favorites }
        if let random = browsable.randomElement() {
            withAnimation(.spring(response: 0.3)) { selectedCategory = random }
            loadJokeForCategory(random)
        }
    }

    func shareJoke() {
        let text = "\(currentJoke.setup)\n\n\(currentJoke.punchline)\n\nShared from Daily Laughs 😂"
        let av = UIActivityViewController(activityItems: [text], applicationActivities: nil)
        UIApplication.shared.connectedScenes
            .compactMap { $0 as? UIWindowScene }
            .first?.windows.first?
            .rootViewController?.present(av, animated: true)
    }
}

// MARK: - Joke Card
struct JokeCard: View {
    let joke: Joke
    let showPunchline: Bool
    let isLiked: Bool
    let heartBounce: Bool
    let onLike: () -> Void
    let onTap: () -> Void

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack(spacing: 6) {
                Text(joke.category.emoji)
                    .font(.caption)
                Text(joke.category.rawValue + " Humor")
                    .font(.caption)
                    .fontWeight(.semibold)
            }
            .foregroundStyle(joke.category.color)
            .padding(.horizontal, 10)
            .padding(.vertical, 5)
            .background(joke.category.color.opacity(0.1))
            .clipShape(Capsule())
            .padding(.bottom, 16)

            Text(joke.setup)
                .font(.system(size: 17, weight: .medium, design: .rounded))
                .foregroundStyle(Color(white: 0.1))
                .lineSpacing(4)
                .padding(.bottom, 16)

            if showPunchline {
                Divider()
                    .overlay(Color.gray.opacity(0.2))
                    .padding(.bottom, 14)

                Text(joke.punchline)
                    .font(.system(size: 16, weight: .semibold, design: .rounded))
                    .foregroundStyle(Color.indigo)
                    .lineSpacing(3)
                    .transition(.move(edge: .bottom).combined(with: .opacity))
                    .padding(.bottom, 16)
            } else {
                Button(action: onTap) {
                    Text("Tap to reveal punchline")
                        .font(.caption)
                        .fontWeight(.medium)
                        .foregroundStyle(.white.opacity(0.7))
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 10)
                        .background(Color.indigo.opacity(0.75))
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                }
                .padding(.bottom, 16)
            }

            HStack {
                HStack(spacing: 3) {
                    ForEach(0..<5) { i in
                        Image(systemName: i < 4 ? "star.fill" : "star")
                            .font(.caption)
                            .foregroundStyle(i < 4 ? Color.yellow : Color.gray.opacity(0.3))
                    }
                }
                Spacer()
                Button(action: onLike) {
                    Image(systemName: isLiked ? "heart.fill" : "heart")
                        .font(.system(size: 18))
                        .foregroundStyle(isLiked ? Color.red : Color.gray.opacity(0.4))
                        .frame(width: 40, height: 40)
                        .background(isLiked ? Color.red.opacity(0.1) : Color.gray.opacity(0.08))
                        .clipShape(Circle())
                        .scaleEffect(heartBounce ? 1.35 : 1.0)
                        .animation(.spring(response: 0.3, dampingFraction: 0.4), value: heartBounce)
                }
            }
        }
        .padding(22)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 24))
        .shadow(color: .black.opacity(0.25), radius: 30, y: 16)
    }
}

// MARK: - Category Tab
struct CategoryTab: View {
    let category: JokeCategory
    let isSelected: Bool
    let favoriteCount: Int?
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            HStack(spacing: 5) {
                Text(category.emoji)
                    .font(.caption)
                Text(category.rawValue)
                    .font(.caption)
                    .fontWeight(.semibold)
                if let count = favoriteCount, count > 0 {
                    Text("\(count)")
                        .font(.system(size: 10, weight: .bold))
                        .foregroundStyle(.white)
                        .padding(.horizontal, 5)
                        .padding(.vertical, 2)
                        .background(Color.red)
                        .clipShape(Capsule())
                }
            }
            .foregroundStyle(isSelected ? .white : .white.opacity(0.45))
            .padding(.horizontal, 14)
            .padding(.vertical, 8)
            .background(isSelected ? .white.opacity(0.18) : .clear)
            .clipShape(RoundedRectangle(cornerRadius: 10))
        }
    }
}
