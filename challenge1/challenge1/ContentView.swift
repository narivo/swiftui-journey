//
//  ContentView.swift
//  challenge1
//
//  Created by user227388 on 10/23/22.
//

import SwiftUI

struct AnswerButton: View {
    var text: String
    var action: () -> Void
    
    var body: some View {
        Button(text) {
            action()
        }
        .buttonStyle(.borderedProminent)
    }
}

struct ContentView: View {
    
    @State private var moves = ["Paper", "Scissors", "Rock"].shuffled()
    @State private var options = ["Win", "Loose"].shuffled()
    @State private var alertTitle = "Wrong"
    @State private var showAlert = false
    @State private var score = 0
    
    @State private var roundCount = 1
    
    var body: some View {
        NavigationView {
            
            ZStack {
                
                RadialGradient(stops: [
                    .init(color: Color(red: 1.00, green: 0.76, blue: 0.03), location: 0.3),
                    .init(color: Color(red: 0.33, green: 0.43, blue: 1.00), location: 0.3)
                ], center: .top, startRadius: 200, endRadius: 700)
                    .ignoresSafeArea()
                
                VStack {
                    Spacer()
                    
                    VStack {
                        Text("Tap correct move if")
                            .font(.subheadline.weight(.heavy))
                            .foregroundStyle(Color(red: 0.13, green: 0.13, blue: 0.13))
                        Text("\(moves[0]) \(options[0])")
                            .font(.largeTitle)
                        AnswerButton(text: moves[0]) {
                            scorePlayer(move: moves[0])
                        }
                        AnswerButton(text: moves[1]) {
                            scorePlayer(move: moves[1])
                        }
                        AnswerButton(text: moves[2]) {
                            scorePlayer(move: moves[2])
                        }
                    }
                    .padding()
                    .frame(idealWidth: .infinity)
                    .background(.regularMaterial)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    
                    Spacer()
                    Spacer()
                    Text("Score: \(score)")
                }
            }
            .alert(alertTitle, isPresented: $showAlert) {
                if roundCount < 10 {
                    Button("Next") {
                        askQuestion()
                        roundCount += 1
                    }
                }
                Button(roundCount < 10 ? "Abandon" : "Finish", role: .cancel) {
                    resetGame()
                    askQuestion()
                }
            } message: {
                Text("Your \(roundCount < 10 ? "" : "Final ")score is \(score)")
            }
            .navigationTitle("Chinese Game")
            .navigationBarTitleDisplayMode(.inline)
        }
        
    }
    
    func resetGame() {
        score = 0
        roundCount = 0
    }
    
    func scorePlayer(move: String) {
        if trueAnswer(text: move) {
            score += 1
            alertTitle = "Good"
        } else {
            score -= 1
            alertTitle = "Wrong"
        }
        showAlert = true
    }
    
    func trueAnswer(text: String) -> Bool {
        switch(moves[0]) {
        case "Paper":
            switch(options[0]) {
            case "Win":
                return text == "Scissors" ? true : false
            case "Loose":
                return text == "Rock" ? true : false
            default:
                return false
            }
        case "Scissors":
            switch(options[0]) {
            case "Win":
                return text == "Rock" ? true : false
            case "Loose":
                return text == "Paper" ? true : false
            default:
                return false
            }
        case "Rock":
            switch(options[0]) {
            case "Win":
                return text == "Paper" ? true : false
            case "Loose":
                return text == "Scissors" ? true : false
            default:
                return false
            }
        default:
            return false
        }
    }
    
    func askQuestion() {
        moves = moves.shuffled()
        options = options.shuffled()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
