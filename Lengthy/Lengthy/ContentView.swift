//
//  ContentView.swift
//  Lengthy
//
//  Created by user227388 on 10/16/22.
//

import SwiftUI

struct ContentView: View {
    
    let units = ["meters", "kilometers", "feet", "yards", "miles"]
    
    @State private var sourceUnit = "meters"
    @State private var outputUnit = "feet"
    
    @State private var input = 0.0
    
    var output: Double {
        
        switch(sourceUnit) {
        case "meters":
            switch(outputUnit) {
            case "kilometers":
                return input/1000
            case "feet":
                return input*3.281
            case "yards":
                return input*1.094
            case "miles":
                return input/1609
            default:
                return input
            }
        case "kilometers":
            switch(outputUnit) {
            case "meters":
                return input*1000
            case "feet":
                return input*3281
            case "yards":
                return input*1094
            case "miles":
                return input/1.609
            default:
                return input
            }
        case "feet":
            switch(outputUnit) {
            case "meters":
                return input/3.281
            case "kilometers":
                return input/3281
            case "yards":
                return input/3
            case "miles":
                return input/5280
            default:
                return input
            }
        case "yards":
            switch(outputUnit) {
            case "meters":
                return input/1.094
            case "kilometers":
                return input/1094
            case "feet":
                return input*3
            case "miles":
                return input/1760
            default:
                return input
            }
        case "miles":
            switch(outputUnit) {
            case "meters":
                return input*1609
            case "kilometers":
                return input*1.609
            case "feet":
                return input*5280
            case "yards":
                return input*1760
            default:
                return input
            }
        default:
            return input
        }
    }
    
    var body: some View {
        Form {
            Section {
                
                Picker("Source: ", selection: $sourceUnit) {
                    ForEach(units, id: \.self) {
                        Text($0)
                    }
                }
                
                Picker("Output: ", selection: $outputUnit) {
                    ForEach(units, id: \.self) {
                        Text($0)
                    }
                }
                
            } header: {
                Text("Units: ")
            }
            
            Section {
                
                TextField("0", value: $input, format: .number)
                    .keyboardType(.decimalPad)
                
                Text("Output: \(output) \(outputUnit)")
                
            } header: {
                Text("Conversion:")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
