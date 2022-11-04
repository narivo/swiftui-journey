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

struct ContentView: View {
    @State private var multiplier = 2
    @State private var numberOfQuestions = 5
    @State private var currentIndex = 1
    @State private var userInput = "1"
    
    let availNumQuestion = [5, 10, 20]
    
    var questions: [Question] {
        var temp = [Question]()
        for i in 1...numberOfQuestions {
            let x = Int.random(in: 1...12)
            temp.append(Question(title: "What is \(x) x \(multiplier) ?", answer: i * multiplier))
        }
        return temp
    }
    
    var body: some View {
        VStack {
            Form {
                Section("configuration") {
                    Stepper("Multiplier: \(multiplier)",
                            value: $multiplier,
                            in: 2...12)
                    Picker("Number of questions: ", selection: $numberOfQuestions) {
                        ForEach(availNumQuestion, id: \.self) {
                            Text("\($0)")
                        }
                    }
                }
                
                Text(questions[currentIndex].title)
                
                TextField("Your input", text: $userInput)
                    .keyboardType(.numberPad)
            }
            .onSubmit {
                print("xyz")
            }
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
