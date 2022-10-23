//
//  Archive1.swift
//  BetterRest
//
//  Created by user227388 on 10/23/22.
//

import SwiftUI

struct Solution {
    
    func main() {
        var components = DateComponents()
        components.hour = 8
        components.minute = 0
        let date = Calendar.current.date(from: components) ?? Date.now
        
        let components2 = Calendar.current.dateComponents([.hour, .minute], from: date)
        let hour = components2.hour ?? 0
        let minute = components2.minute ?? 0
    }
}

struct Archive: View {
    var body: some View {
        Text(Date.now, format: .dateTime.hour().minute())
        Text(Date.now, format: .dateTime.day().month().year())
        Text(Date.now.formatted(date: .long, time: .shortened))
    }
}
