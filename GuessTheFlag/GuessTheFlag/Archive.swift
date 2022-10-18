//
//  Archive.swift
//  GuessTheFlag
//
//  Created by user227388 on 10/17/22.
//

import SwiftUI

struct Archive: View {
    @State private var showingAlert = false
    
    var body: some View {
        
        Button("Show alert") {
            showingAlert = true
        }.alert("Important message", isPresented: $showingAlert) {
            Button("Delete", role: .destructive) { }
            Button("Cancel", role: .cancel) { }
        } message: {
            Text("Please read this.")
        }
        
        /*Button {
            print("Edit button was tapped")
        } label: {
            Label("Edit", systemImage: "pencil")
        }*/
        
        /*Button {
            print("Edit button was tapped")
        } label: {
            Image(systemName: "pencil")
                .renderingMode(.original)
        }*/
        
        /*Button {
            print("Button was tapped")
        } label: {
            Text("Tap me!")
                .padding()
                .foregroundColor(.white)
                .background(.red)
        }*/
        
        /*VStack {
            Button("Button 1") { }
                .buttonStyle(.bordered)
            Button("Button 2", role: .destructive) { }
                .buttonStyle(.bordered)
            Button("Button 3") { }
                .buttonStyle(.borderedProminent)
                //.tint(.mint)
            Button("Button 4", role: .destructive) { }
                .buttonStyle(.borderedProminent)
        }*/
        
        /*AngularGradient(gradient: Gradient(colors: [.red, .yellow, .green, .blue, .purple, .red]), center: .center)*/
        
        /*RadialGradient(gradient: Gradient(colors: [.blue, .black]), center: .center, startRadius: 20, endRadius: 200)*/
        
        /*LinearGradient(gradient: Gradient(stops: [
            Gradient.Stop(color: .white, location: 0.45),
            .init(color: .black, location: 0.55),
        ]), startPoint: .top, endPoint: .bottom)*/
        
        /*ZStack {
            VStack(spacing: 0) {
                Color.red
                Color.blue
            }
            Text("Your Content")
                .foregroundStyle(.secondary)
                //.foregroundColor(.secondary)
                .padding(50)
                .background(.ultraThinMaterial)
        }
        .ignoresSafeArea()*/
        
        /*ZStack {
            Color.red
                .frame(minWidth: 200, maxWidth: .infinity, maxHeight: 200)
            Text("Second long text")
        }
        .ignoresSafeArea()*/
    }
}

struct Archive_Previews: PreviewProvider {
    static var previews: some View {
        Archive()
    }
}
