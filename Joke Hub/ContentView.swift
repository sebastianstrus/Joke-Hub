//
//  ContentView.swift
//  Joke Hub
//
//  Created by Sebastian Strus on 3/12/26.
//

import SwiftUI

// MARK: - Joke Model
struct Joke: Identifiable {
    let id = UUID()
    let setup: String
    let punchline: String
    let category: JokeCategory
}

enum JokeCategory: String, CaseIterable {
    case all = "All"
    case favorites = "Favorites"
    case tech = "Tech"
    case dad = "Dad"
    case puns = "Puns"
    case science = "Science"
    case animals = "Animals"
    case food = "Food"
    case sports = "Sports"
    case music = "Music"
    case history = "History"
    case dark = "Dark"

    var emoji: String {
        switch self {
        case .all:       return "🎭"
        case .favorites: return "❤️"
        case .tech:      return "🧑‍💻"
        case .dad:       return "👨"
        case .puns:      return "🎯"
        case .science:   return "🔬"
        case .animals:   return "🐾"
        case .food:      return "🍕"
        case .sports:    return "⚽"
        case .music:     return "🎵"
        case .history:   return "📜"
        case .dark:      return "🌑"
        }
    }

    var color: Color {
        switch self {
        case .all:       return .purple
        case .favorites: return .red
        case .tech:      return .blue
        case .dad:       return .orange
        case .puns:      return .green
        case .science:   return .cyan
        case .animals:   return .brown
        case .food:      return .red
        case .sports:    return .green
        case .music:     return .pink
        case .history:   return .indigo
        case .dark:      return .gray
        }
    }
}

// MARK: - Joke Provider
struct JokeProvider {
    static let jokes: [Joke] = [
        // Tech
        Joke(setup: "Why do programmers prefer dark mode?", punchline: "Because light attracts bugs! 🐛", category: .tech),
        Joke(setup: "Why did the Java developer wear glasses?", punchline: "Because he couldn't C#! 🔭", category: .tech),
        Joke(setup: "What's a developer's favorite place?", punchline: "The foo bar! 🍺", category: .tech),
        Joke(setup: "Why do Python programmers need glasses?", punchline: "Because they can't C! 👓", category: .tech),
        Joke(setup: "How many programmers does it take to change a light bulb?", punchline: "None, that's a hardware problem! 💡", category: .tech),
        Joke(setup: "Why did the programmer quit his job?", punchline: "Because he didn't get arrays! 📊", category: .tech),
        Joke(setup: "What do you call a programmer from Finland?", punchline: "Nerdic! 🇫🇮", category: .tech),
        Joke(setup: "Why was the JavaScript developer sad?", punchline: "Because he didn't know how to 'null' his feelings! 😢", category: .tech),
        Joke(setup: "What did the router say to the doctor?", punchline: "It hurts when IP! 🌐", category: .tech),
        Joke(setup: "Why do programmers always mix up Halloween and Christmas?", punchline: "Because Oct 31 == Dec 25! 🎃", category: .tech),
        Joke(setup: "What's a computer's favorite snack?", punchline: "Microchips! 🍟", category: .tech),
        Joke(setup: "Why did the developer go broke?", punchline: "Because he used up all his cache! 💸", category: .tech),

        // Dad
        Joke(setup: "Why did the scarecrow win an award?", punchline: "Because he was outstanding in his field! 🌾", category: .dad),
        Joke(setup: "Why can't you trust an atom?", punchline: "They make up everything! ⚛️", category: .dad),
        Joke(setup: "I told my wife she should embrace her mistakes.", punchline: "She gave me a hug! 🤗", category: .dad),
        Joke(setup: "What do you call a fake noodle?", punchline: "An impasta! 🍝", category: .dad),
        Joke(setup: "I'm reading a book about anti-gravity.", punchline: "It's impossible to put down! 📚", category: .dad),
        Joke(setup: "What do you call a sleeping dinosaur?", punchline: "A dino-snore! 🦕", category: .dad),
        Joke(setup: "Why did the bicycle fall over?", punchline: "Because it was two-tired! 🚲", category: .dad),
        Joke(setup: "What do you call cheese that isn't yours?", punchline: "Nacho cheese! 🧀", category: .dad),
        Joke(setup: "Why can't Elsa have a balloon?", punchline: "Because she'll let it go! 🎈", category: .dad),
        Joke(setup: "Did you hear about the claustrophobic astronaut?", punchline: "He just needed a little space! 🚀", category: .dad),
        Joke(setup: "Why do cows wear bells?", punchline: "Because their horns don't work! 🐄", category: .dad),

        // Puns
        Joke(setup: "What do you call a fish without eyes?", punchline: "A fsh! 🐟", category: .puns),
        Joke(setup: "I used to hate facial hair...", punchline: "But then it grew on me! 🧔", category: .puns),
        Joke(setup: "What do you call a bear with no teeth?", punchline: "A gummy bear! 🐻", category: .puns),
        Joke(setup: "I used to be addicted to soap.", punchline: "But I'm clean now! 🧼", category: .puns),
        Joke(setup: "Why did the golfer bring extra pants?", punchline: "In case he got a hole in one! ⛳", category: .puns),
        Joke(setup: "What do you call a cow on a trampoline?", punchline: "A milkshake! 🥛", category: .puns),
        Joke(setup: "Why did the tomato turn red?", punchline: "Because it saw the salad dressing! 🥗", category: .puns),
        Joke(setup: "What do you call a lazy kangaroo?", punchline: "A pouch potato! 🦘", category: .puns),
        Joke(setup: "Why did the math book look so sad?", punchline: "It had too many problems! 📖", category: .puns),
        Joke(setup: "What do you call a pile of cats?", punchline: "A meow-ntain! 🏔️", category: .puns),

        // Science
        Joke(setup: "Why did the biology teacher break up with the physics teacher?", punchline: "There was no chemistry! 💔", category: .science),
        Joke(setup: "What do you do with a sick chemist?", punchline: "If you can't helium and you can't curium, you might as well barium! ⚰️", category: .science),
        Joke(setup: "What did the DNA say to the other DNA?", punchline: "Do these genes make me look fat? 🧬", category: .science),
        Joke(setup: "A neutron walks into a bar and asks: 'How much for a beer?'", punchline: "The bartender says: 'For you, no charge!' ⚡", category: .science),
        Joke(setup: "What did the quantum physicist say when he wanted to fight?", punchline: "Let me atom! 💥", category: .science),
        Joke(setup: "How do astronomers organize a party?", punchline: "They planet! 🪐", category: .science),
        Joke(setup: "What's the most musical planet?", punchline: "Nep-tune! 🎵", category: .science),
        Joke(setup: "Why did the sun go to school?", punchline: "To get a little brighter! ☀️", category: .science),

        // Animals
        Joke(setup: "Why don't elephants use computers?", punchline: "Because they're afraid of the mouse! 🐘", category: .animals),
        Joke(setup: "What do you call a dog that does magic tricks?", punchline: "A labracadabrador! 🐕", category: .animals),
        Joke(setup: "Why did the cat sit on the computer?", punchline: "To keep an eye on the mouse! 🐱", category: .animals),
        Joke(setup: "What do you call an alligator in a vest?", punchline: "An investigator! 🐊", category: .animals),
        Joke(setup: "Why do fish swim in salt water?", punchline: "Because pepper makes them sneeze! 🐠", category: .animals),
        Joke(setup: "What do you call a pig that does karate?", punchline: "A pork chop! 🥋", category: .animals),
        Joke(setup: "Why did the cow go to outer space?", punchline: "To see the moooon! 🌕", category: .animals),
        Joke(setup: "What do you call a bear caught in the rain?", punchline: "A drizzly bear! 🐻", category: .animals),

        // Food
        Joke(setup: "Why did the banana go to the doctor?", punchline: "Because it wasn't peeling well! 🍌", category: .food),
        Joke(setup: "What do you call a stolen yam?", punchline: "A hot potato! 🥔", category: .food),
        Joke(setup: "Why did the orange stop rolling down the hill?", punchline: "It ran out of juice! 🍊", category: .food),
        Joke(setup: "Why did the cookie cry?", punchline: "Because its mom was a wafer so long! 🍪", category: .food),
        Joke(setup: "What do you call an angry pea?", punchline: "Grum-pea! 😡", category: .food),
        Joke(setup: "Why did the ice cream truck break down?", punchline: "Because of the rocky road! 🍦", category: .food),
        Joke(setup: "What do you call a sad strawberry?", punchline: "A blueberry! 🫐", category: .food),
        Joke(setup: "Why couldn't the sesame seed leave the casino?", punchline: "Because it was on a roll! 🎰", category: .food),
        Joke(setup: "What did the lettuce say to the celery?", punchline: "Quit stalking me! 🥬", category: .food),

        // Sports
        Joke(setup: "Why did the football coach go to the bank?", punchline: "To get his quarterback! 🏈", category: .sports),
        Joke(setup: "Why are basketball players bad at weddings?", punchline: "They always dribble! 🏀", category: .sports),
        Joke(setup: "What did the baseball glove say to the ball?", punchline: "Catch you later! ⚾", category: .sports),
        Joke(setup: "Why can't Cinderella play soccer?", punchline: "She always runs away from the ball! ⚽", category: .sports),
        Joke(setup: "Why did the tennis court get flooded?", punchline: "Because the players kept raising the net! 🎾", category: .sports),
        Joke(setup: "What sport do horses like most?", punchline: "Stable tennis! 🐎", category: .sports),
        Joke(setup: "Why did the swimmer break up with the pool?", punchline: "It was too shallow! 🏊", category: .sports),

        // Music
        Joke(setup: "Why did Mozart sell his chickens?", punchline: "Because they kept saying Bach Bach Bach! 🐓", category: .music),
        Joke(setup: "Why did the musician get locked out of his house?", punchline: "He left his keys on the piano! 🎹", category: .music),
        Joke(setup: "What do you call a cow that plays guitar?", punchline: "A moo-sician! 🐄", category: .music),
        Joke(setup: "Why couldn't the string quartet find their composer?", punchline: "He was Haydn! 🎻", category: .music),
        Joke(setup: "What's a skeleton's least favorite instrument?", punchline: "The trombone — too many slides! 🦴", category: .music),
        Joke(setup: "What did the guitar say to the guitarist?", punchline: "Stop picking on me! 🎸", category: .music),
        Joke(setup: "Why did the singer climb a ladder?", punchline: "To reach the high notes! 🎤", category: .music),
        Joke(setup: "What's a vampire's favorite instrument?", punchline: "The organ! 🎶", category: .music),

        // History
        Joke(setup: "Why did Julius Caesar buy crayons?", punchline: "He wanted to Mark Antony! ✏️", category: .history),
        Joke(setup: "What did the Ancient Romans use to cut their pizza?", punchline: "Little Caesars! 🍕", category: .history),
        Joke(setup: "Why did the Egyptian pharaoh get confused?", punchline: "He was in de-Nile! 🐊", category: .history),
        Joke(setup: "Why were the Dark Ages so dark?", punchline: "Because there were too many knights! 🏰", category: .history),
        Joke(setup: "Why did Napoleon always lose at cards?", punchline: "He always stood near the deck! 🃏", category: .history),
        Joke(setup: "What's the fruitiest subject in school?", punchline: "History — it's full of dates! 📅", category: .history),
        Joke(setup: "Why did the pirate buy an eye patch?", punchline: "Because he couldn't afford an iPad! 🏴‍☠️", category: .history),

        // Dark
        Joke(setup: "Why don't graveyards ever get crowded?", punchline: "People are dying to get in! ⚰️", category: .dark),
        Joke(setup: "I have a lot of jokes about unemployed people...", punchline: "None of them work! 💼", category: .dark),
        Joke(setup: "My wife told me I had to stop acting like a flamingo.", punchline: "I had to put my foot down! 🦩", category: .dark),
        Joke(setup: "I told my doctor I broke my arm in two places.", punchline: "He told me to stop going to those places! 🩺", category: .dark),
        Joke(setup: "Why do we tell actors to 'break a leg?'", punchline: "Because every play has a cast! 🎭", category: .dark),
        Joke(setup: "What's the last thing a tick-tock says?", punchline: "Tock! ⏰", category: .dark),
    ]

    static func jokes(for category: JokeCategory, likedIDs: Set<UUID>) -> [Joke] {
        switch category {
        case .all:       return jokes
        case .favorites: return jokes.filter { likedIDs.contains($0.id) }
        default:         return jokes.filter { $0.category == category }
        }
    }
}

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
                        Text("Daily Laughs")
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
                .offset(y: cardOffset)
                .opacity(cardOpacity)
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

        withAnimation(.easeInOut(duration: 0.2)) {
            cardOffset = -20
            cardOpacity = 0
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            let pool = JokeProvider.jokes(for: selectedCategory, likedIDs: likedJokes)
            if pool.isEmpty {
                selectedCategory = .all
                currentJoke = JokeProvider.jokes.filter { $0.id != currentJoke.id }.randomElement()
                    ?? JokeProvider.jokes.randomElement()!
            } else {
                currentJoke = pool.filter { $0.id != currentJoke.id }.randomElement()
                    ?? pool.randomElement()!
            }
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
