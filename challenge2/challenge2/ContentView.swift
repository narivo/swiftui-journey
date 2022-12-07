//
//  ContentView.swift
//  challenge2
//
//  Created by user227388 on 11/4/22.
//

import SwiftUI

struct Question: Hashable {
    var title: String
    var answer: Int
}

struct QuestionGenerator {
    var questions = [Question]()
    
    init(numberOfQuestions: Int, multiplier: Int) {
        for x in 1...numberOfQuestions {
            questions.append(Question(title: "What is \(x) x \(multiplier) ?", answer: x * multiplier))
        }
    }
    
    subscript(i: Int) -> Question {
        get {
            return questions[i]
        }
        set(newValue) {
            questions[i] = newValue
        }
    }
    
    var count: Int {
        return questions.count
    }
}

struct ContentView: View {
    @State private var makeSettings = true
    
    @State private var multiplier = 2
    @State private var numberOfQuestions = 5
    @State private var currentIndex = 1
    @State private var userInput = "1"
    @State private var isEndgame = false
    @State private var correctAnswers = 0
    
    let availNumQuestion = [5, 10, 20]
    
    private var questions: QuestionGenerator {
        QuestionGenerator(numberOfQuestions: numberOfQuestions, multiplier: multiplier)
    }
    
    private func validateAnswer() {
        guard currentIndex >= questions.count else {
            if Int(userInput) == questions[currentIndex].answer {
                correctAnswers += 1
            }
            userInput = ""
            currentIndex += 1
            
            if currentIndex == questions.count {
                isEndgame = true
                makeSettings = true
                currentIndex = 1
            }
            
            return
        }
    }
    
    var body: some View {
        NavigationView {
            Form {
                if makeSettings {
                    
                    Section("configuration") {
                        Stepper("Multiplier: \(multiplier)",
                                value: $multiplier,
                                in: 2...12)
                        Picker("Number of questions: ", selection: $numberOfQuestions) {
                            ForEach(availNumQuestion, id: \.self) {
                                Text("\($0)")
                            }
                        }
                        Button("Done") {
                            makeSettings = false
                        }
                    }
                    
                } else {
                    
                    Section("questions") {
                        
                        let questionTitle = (currentIndex < questions.count) ? questions[currentIndex].title : "End Game"
                        
                        Text(questionTitle)
                        
                        TextField("Your input", text: $userInput)
                            .onSubmit {
                                validateAnswer()
                            }
                            .keyboardType(.numberPad)
                    }
                }
                
            }
            .navigationTitle("Edutainment app")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItemGroup (placement: .keyboard, content: {
                    Spacer()
                    Button {
                        validateAnswer()
                    } label: {
                        Text("Done")
                    }

                })
            }
            .alert("You got \(correctAnswers + 1) answers right", isPresented: $isEndgame, actions: {
                Button {
                    isEndgame = false
                } label: {
                    Text("OK")
                }

            })
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
