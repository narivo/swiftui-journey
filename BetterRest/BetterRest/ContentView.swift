//
//  ContentView.swift
//  BetterRest
//
//  Created by user227388 on 10/23/22.
//

import CoreML
import SwiftUI

struct ContentView: View {
    @State private var sleepAmount = 4
    @State private var wakeUp = defaultWakeUp
    @State private var coffeeAmount = 1
    
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @State private var showingAlert = false
    
    var estimatedBedtime: String {
        return calculateBedTime()
    }
    
    private static var defaultWakeUp: Date {
        var components = DateComponents()
        components.hour = 7
        components.minute = 0
        return Calendar.current.date(from: components) ?? Date.now
    }
    
    var body: some View {
        
        NavigationView {
            Form {
                Section {
                    
                    DatePicker("Please enter a time", selection: $wakeUp, displayedComponents: .hourAndMinute)
                        .labelsHidden()
                    
                } header: {
                    
                    Text("When do you want to wake up ?")
                        .font(.headline)
                }
                
                Section {
                    
                    Picker("\(sleepAmount + 4) hours", selection: $sleepAmount) {
                        ForEach(4..<13) {
                            Text("\($0)")
                        }
                    }
                } header: {
                    Text("Desired amount of sleep")
                        .font(.headline)
                    
                }
                
                Section {
                    
                    Stepper(coffeeAmount == 1 ? "1 cup" : "\(coffeeAmount) cups", value: $coffeeAmount, in: 1...20)
                } header: {
                    
                    Text("Daily cofee intake")
                        .font(.headline)
                }
                
                Section {
                    Text("\(estimatedBedtime)")
                        .font(.largeTitle)
                } header: {
                    Text("Your ideal bed time: ")
                        .font(.headline)
                }
            }
            .navigationTitle("BetterRest")
            /*.toolbar {
                Button("Calculate", action: calculateBedTime)
            }*/
            .alert(alertTitle, isPresented: $showingAlert) {
                Button("OK") { }
            } message: {
                Text(alertMessage)
            }
        }
        
        /*Form {
         Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4...12, step: 0.25)
         
         DatePicker("Please enter a date", selection: $wakeUp, in: Date.now..., displayedComponents: .hourAndMinute)
         .labelsHidden()
         }*/
    }
    
    func calculateBedTime() -> String {
        do {
            let config = MLModelConfiguration()
            let model = try SleepCalculator(configuration: config)
            
            let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
            let hour = (components.hour ?? 0) * 60 * 60
            let minute = (components.minute ?? 0) * 60
            
            let prediction = try model.prediction(wake: Double(hour + minute), estimatedSleep: Double(sleepAmount + 4), coffee: Double(coffeeAmount))
            
            let sleepTime = wakeUp - prediction.actualSleep
            
            return sleepTime.formatted(date: .omitted, time: .shortened)
        } catch {
            showingAlert = true
            alertTitle = "Error"
            alertMessage = "Sorry, there was a problem calculating your bedtime."
        }
        
        return "Unkown bed time"
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
