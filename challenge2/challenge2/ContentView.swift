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
        for _ in 1...numberOfQuestions {
            let x = Int.random(in: 1...12)
            questions.append(Question(title: "What is \(x) x \(multiplier) ?", answer: x * multiplier))
        }
    }
}

struct ContentView: View {
    @State private var makeSettings = true
    
    @State private var multiplier = 2
    @State private var numberOfQuestions = 5
    @State private var currentIndex = 1
    @State private var userInput = "1"
    
    let availNumQuestion = [5, 10, 20]
    
    @State private var questionGenerator = QuestionGenerator(numberOfQuestions: numberOfQuestions, multiplier: multiplier)
    
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
                        
                        Text(questions[currentIndex].title)
                        
                        TextField("Your input", text: $userInput)
                            .keyboardType(.numberPad)
                    }
                }
                
            }
            .navigationTitle("Edutainment app")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItemGroup (placement: .keyboard, content: {
                    Spacer()
                    
                    Button("Done") {
                        
                    }
                })
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
