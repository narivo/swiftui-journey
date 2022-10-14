//
//  Archive.swift
//  WeSplit
//
//  Created by user227388 on 10/12/22.
//

import SwiftUI

struct Archive: View {
    //@State private var tapCount = 0
    //@State private var name = ""
    let students = ["Harry", "Hermione", "Ron"]
    @State private var selectedStudent = "Harry"
    
    var body: some View {
        NavigationView {
            Form {
                Picker("Select your student", selection: $selectedStudent) {
                    ForEach(students, id: \.self) {
                        Text($0)
                    }
                }
            }
            .navigationTitle("Hogwarts")
        }
        
        /*Form {
            ForEach(0..<100) { number in
                Text("Row \(number)")
            }
        }*/
        
        /*Form {
            TextField("Enter your name", text: $name)
            Text("Your name is \(name)")
        }*/
        
        /*Button("Tap count: \(tapCount)") {
            tapCount += 1
        }*/
        
        /*NavigationView {
            Form {
                Section {
                    Text("Hello, world!")
                }
            }
            .navigationTitle("SwiftUI")
            .navigationBarTitleDisplayMode(.inline)
        }*/
        
        
        /*VStack {
            
            Form {
                Section {
                    
                    Group {
                        
                        Image(systemName: "globe")
                            .imageScale(.large)
                            .foregroundColor(.accentColor)
                        Text("Hello, world!")
                        
                    }
                    
                    Group {
                        
                        Text("Hello, world!")
                        
                    }
                    
                }
                
                Group {
                    
                    Image(systemName: "globe")
                        .imageScale(.large)
                        .foregroundColor(.accentColor)
                    Text("Hello, world!")
                    
                }
            }
        }
        .padding()*/
    }
}

struct Archive_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

