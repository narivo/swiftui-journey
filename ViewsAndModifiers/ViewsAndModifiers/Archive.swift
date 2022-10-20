//
//  Archive.swift
//  ViewsAndModifiers
//
//  Created by user227388 on 10/20/22.
//

import SwiftUI

struct Archive: View {
    let motto1 = Text("Draco dormiens")
    let motto2 = Text("nunquam titillandus")
    
    @ViewBuilder var spells: some View {
        // VStack { // If not specifying @ViewBuilder, need to manage manually your view layout
        //Group { // Layout Agnositc
            Text("Lumos")
            Text("Obliviate")
        //}
    }
    
    @State private var useRedText = false
    
    var body: some View {
        
        VStack {
            Text("Gryffindor")
                .font(.largeTitle)
            Text("Hufflepuff")
            Text("Ravenclaw")
            Text("Slytherin")
        }
        .font(.title)
        //.blur(radius: 5) // RTFM

        /*
        // Optimized -> Prefer ternary operator
        Button("Hello world") {
            useRedText.toggle()
        }
        .foregroundColor(useRedText ? .red : .blue)
        
        // Not Optimized
        if useRedText {
            Button("Hello world") {
                useRedText.toggle()
            }
            .foregroundColor(.red)
        } else {
            Button("Hello world") {
                useRedText.toggle()
            }
            .foregroundColor(.blue)
        }*/
        
        /*
        // internally using @ViewBuilder attribute
        Text("Hello")
        Text("Hello")
        Text("Hello")
        Text("Hello")
        
        // TupleView of 4 content
        VStack {
            Text("Hello")
            Text("Hello")
            Text("Hello")
            Text("Hello")
        }*/
                
        /*Text("Hello, world!")
            .padding()
            .background(.red)
            .padding()
            .background(.blue)
            .padding()
            .background(.green)
            .padding()
            .background(.yellow)*/
        
        /*Button("Hello, world !"){
            print(type(of: self.body))
        }
        .background(.red)
        .frame(width: 200, height: 200)*/
    }
}

struct Archive_Previews: PreviewProvider {
    static var previews: some View {
        Archive()
    }
}
