//
//  Archive.swift
//  Animations
//
//  Created by user227388 on 11/1/22.
//

import SwiftUI

struct Archive: View {
    @State private var animationAmount = 0.0
    //@State private var animationAmount = 1.0
    
    var body: some View {
        Button("Tap Me") {
            withAnimation(.interpolatingSpring(stiffness: 5, damping: 1)) {
            //withAnimation {
                animationAmount += 360
            }
        }
        .padding(50)
        .background(.red)
        .foregroundColor(.white)
        .clipShape(Circle())
        .rotation3DEffect(.degrees(animationAmount), axis: (x: 0, y: 1, z: 0))
        
        /*VStack {
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
        }*/
        
        /*Button("Tap Me") {
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
        }*/
        
        /*.scaleEffect(animationAmount)
        .animation(
            .interpolatingSpring(stiffness: 50, damping: 1)
                .delay(1)
                .repeatCount(3, autoreverses: true),
            value: animationAmount)*/
    }
}

struct Archive_Previews: PreviewProvider {
    static var previews: some View {
        Archive()
    }
}
