//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by user227388 on 10/17/22.
//

import SwiftUI

struct FlagImage: View {
    var imageName = "Estonia"
    
    var body: some View {
        Image(imageName)
            .renderingMode(.original)
            .clipShape(Capsule())
            .shadow(radius: 5)
    }
}

struct LargeTitle: ViewModifier {
    func body(content: Content) -> some View {
        content.font(.largeTitle.weight(.semibold))
    }
}

extension View {
    func largeTitle() -> some View {
        return modifier(LargeTitle())
    }
}

struct ContentView: View {
    @State private var showingScore = false
    @State private var scoreTitle = ""
    
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    @State private var rotationAngles = [0.0, 0.0, 0.0]
    
    @State private var score = 0
    
    @State private var rounds = 1
    
    @State private var opacityAmounts = [1.0, 1.0, 1.0]
    
    var body: some View {
        NavigationView {
            
            ZStack {
                RadialGradient(stops: [
                    .init(color: Color(red: 0.56, green: 0.14, blue: 0.67), location: 0.3),
                    .init(color: Color(red: 0.85, green: 0.11, blue: 0.38), location: 0.3)
                ], center: .top, startRadius: 200, endRadius: 700)
                    .ignoresSafeArea()
                
                VStack {
                    Spacer()
                    
                    VStack(spacing: 30) {
                        VStack {
                            Text("Tap the flag of")
                                .foregroundStyle(.secondary)
                                .font(.subheadline.weight(.heavy))
                            Text(countries[correctAnswer])
                                .largeTitle()
                        }
                        
                        ForEach(0..<3) { number in
                            Button {
                                rotationAngles[number] = 360
                                for i in 0..<3 {
                                    if number != i {
                                        opacityAmounts[i] = 0.25
                                    }
                                }
                                flagTapped(number)
                            } label: {
                                FlagImage(imageName: countries[number])
                            }
                            .rotation3DEffect(.degrees(rotationAngles[number]), axis: (x: 0, y: 1, z: 0))
                            .animation(.spring(), value: rotationAngles[number])
                            .opacity(opacityAmounts[number])
                            .animation(.easeOut, value: opacityAmounts[number])
                            
                        }
                    }
                    .frame(idealWidth: .infinity)
                    .padding(30)
                    .background(.regularMaterial)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    
                    Spacer()
                    
                    Text("Score: \(score)")
                        .foregroundStyle(.primary)
                }
                
            }
            .alert(scoreTitle, isPresented: $showingScore) {
                Button("Abandon", action: {
                    resetGame()
                    askQuestion()
                })
                let command = (rounds == 8) ? "Retry" : "Continue"
                Button(command, action: {
                    if command == "Retry" {
                        resetGame()
                    }
                    askQuestion()
                })
            } message: {
                let message = (rounds == 8) ? "You final score is \(score)" : "You score is \(score)"
                Text(message)
            }
            .navigationTitle("Guess The Flag")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
    func flagTapped(_ number: Int) {
        if number == correctAnswer {
            scoreTitle = "Correct"
            score += 1
        } else {
            scoreTitle = "Wrong. That's the flag of \(countries[number])"
            score -= 1
        }
        
        showingScore = true
    }
    
    func askQuestion() {
        rounds += 1
        countries = countries.shuffled()
        correctAnswer = Int.random(in: 0...2)
        
        rotationAngles = [0.0, 0.0, 0.0]
        opacityAmounts = [1.0, 1.0, 1.0]
    }
    
    fileprivate func resetGame() {
        score = 0
        rounds = 0
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
