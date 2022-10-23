//
//  ContentView.swift
//  WeSplit
//
//  Created by user227388 on 10/12/22.
//

import SwiftUI

struct ContentView: View {
    
    let tipPercentages = [10, 15, 20, 25, 0]
    let currency = Locale.current.currency?.identifier ?? "USD"
    
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 20
    
    @FocusState private var amountIsFocused: Bool
    
    var grandTotal: Double {
        
        let tipSelection = Double(tipPercentage)
        
        let tipValue = checkAmount/100 * tipSelection
        return checkAmount + tipValue
    }
    
    var totalPerPerson: Double {
        
        let peopleCount = Double(numberOfPeople+2)
        return grandTotal / peopleCount
        
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Amount: ", value: $checkAmount, format: .currency(code: currency))
                        .keyboardType(.decimalPad)
                        .focused($amountIsFocused)
                    
                    Picker("Number of people: ", selection: $numberOfPeople) {
                        ForEach(2..<100) {
                            Text("\($0) people")
                        }
                    }
                    
                }
                
                Section {
                    
                    Picker("Tip percentage", selection: $tipPercentage) {
                        ForEach(tipPercentages, id: \.self) {
                            Text($0, format: .percent)
                        }
                    }.pickerStyle(.segmented)
                } header: {
                    Text("How much tip do you want to leave?")
                }
                
                
                Section {
                    Text(grandTotal, format: .currency(code: currency))
                        .foregroundColor(tipPercentage == 0 ? .red : .black)
                } header: {
                    Text("Total amount: ")
                }
                
                Section {
                    Text(totalPerPerson, format: .currency(code: currency))
                } header: {
                    Text("Amount per person: ")
                }
            }
            .navigationTitle("WeSplit")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    
                    Button("Done") {
                        amountIsFocused = false
                    }
                }
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
