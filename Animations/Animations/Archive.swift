//
//  Archive.swift
//  Animations
//
//  Created by user227388 on 11/1/22.
//

import SwiftUI


struct Archive: View {
    let letters = Array("Hello SwiftUI")
    @State private var enabled = false
    @State private var dragAmount = CGSize.zero
    
    var body: some View {
        HStack(spacing: 0) {
            ForEach(0..<letters.count, id: \.self) { num in
                Text(String(letters[num]))
                    .padding(5)
                    .font(.title)
                    .background(enabled ? .blue : .red)
                    .offset(dragAmount)
                    .animation(.default.delay(Double(num) / 20), value: dragAmount)
            }
        }
        .gesture(
            DragGesture()
                .onChanged { dragAmount = $0.translation }
                .onEnded { _ in
                    dragAmount = .zero
                    enabled.toggle()
                }
        )
    }
}
/*@State private var isShowingRed = false

var body: some View {
    VStack {
        Button("Tap Me") {
            withAnimation {
                isShowingRed.toggle()
            }
        }

        if isShowingRed {
            Rectangle()
                .fill(.red)
                .frame(width: 200, height: 200)
                //.transition(.scale)
                .transition(.asymmetric(insertion: .scale, removal: .opacity))
        }
    }
}*/
        
/*
 @State private var dragAmount = CGSize.zero
 
 var body: some View {
         LinearGradient(gradient: Gradient(colors: [.yellow, .red]), startPoint: .topLeading, endPoint: .bottomTrailing)
            .frame(width: 300, height: 200)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .offset(dragAmount)
            .gesture(
                DragGesture()
                    .onChanged { dragAmount = $0.translation }
                    //.onEnded { _ in dragAmount = .zero }
                    .onEnded { _ in
                        withAnimation(.spring()) {
                            dragAmount = .zero
                        }
                    }
            )
            //.animation(.spring(), value: dragAmount)
 }*/
        
/*
@State private var enabled = false
 
var body: some View {
         Button("Tap Me") {
            enabled.toggle()
        }
        .padding(50)
        .background(enabled ? .blue : .red)
        .animation(nil, value: enabled) // bypass animation by passing nil
        .foregroundColor(.white)
        .clipShape(RoundedRectangle(cornerRadius: enabled ? 60 : 0))
        .animation(.interpolatingSpring(stiffness: 10, damping: 1), value: enabled)
 }*/
    
/*
 @State private var animationAmount = 0.0
 
 var body: some View {
 VStack {
            Stepper("Scale amount", value: $animationAmount.animation(), in: 1...10)
            
            Spacer()
            
            Button("Tap Me") {
                animationAmount += 1
            }
            .padding(40)
            .background(.red)
            .foregroundColor(.white)
            .clipShape(Circle())
            .scaleEffect(animationAmount)
        }
 }*/
        
/*
@State private var animationAmount = 1.0
         
var body: some View {
         Button("Tap Me") {
            animationAmount += 1
        }
        .padding(50)
        .background(.red)
        .foregroundColor(.white)
        .clipShape(Circle())
        .overlay(
            Circle()
                .stroke(.red)
                .scaleEffect(animationAmount)
                .opacity(2 - animationAmount)
                .animation(
                    .easeInOut(duration: 1)
                        .repeatForever(autoreverses: false),
                    value: animationAmount
                )
        )
        .onAppear {
            animationAmount = 2
        }
}*/
        
/*@State private var animationAmount = 1.0
         
var body: some View {
    Button("Tap Me") {
        animationAmount += 1
    }
    .padding(50)
    .background(.red)
    .foregroundColor(.white)
    .clipShape(Circle())
    .scaleEffect(animationAmount)
    .animation(
        .interpolatingSpring(stiffness: 50, damping: 1)
        .delay(1)
        .repeatCount(3, autoreverses: true),
        value: animationAmount
    )
 }*/

struct Archive_Previews: PreviewProvider {
    static var previews: some View {
        Archive()
    }
}
