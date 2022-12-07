//
//  Archive.swift
//  iExpense
//
//  Created by MadiApps on 07/12/2022.
//

import SwiftUI

struct User: Codable {
    let firstName: String
    let lastName: String
}

struct Archive: View {
    @State private var user = User(firstName: "Taylor", lastName: "Swift")

    
        var body: some View {
            Button("Save User") {
                let encoder = JSONEncoder()
                let decoder = JSONDecoder()

                if let data = try? encoder.encode(user) {
                    UserDefaults.standard.set(data, forKey: "UserData")
                }
                
                if let storedUser = UserDefaults.standard.string(forKey: "UserData"), let user = try? decoder.decode(User.self, from: Data(storedUser.utf8)) {
                    debugPrint(user)
                }
            }
        }
}

/*struct Archive: View {
    @AppStorage("TapCount") private var tapCount = 0
    
        var body: some View {
            Button("Tap count: \(tapCount)") {
                tapCount += 1
            }
        }
}*/

/*struct Archive: View {
    @State private var numbers = [Int]()
    @State private var currentNumber = 1
    
        var body: some View {
            NavigationView {
                VStack {
                    List {
                        ForEach(numbers, id: \.self) {
                            Text("Row \($0)")
                        }
                        .onDelete(perform: deleteRow)
                    }
                    
                    Button("Add number") {
                        numbers.append(currentNumber)
                        currentNumber += 1
                    }
                }
                .navigationTitle("Delete")
                .toolbar {
                    EditButton()
                }
            }
            
        }
    
    func deleteRow(at offsets: IndexSet) {
        numbers.remove(atOffsets: offsets)
    }
}*/

/*struct SecondView: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        Button("Dismiss") {
            dismiss()
        }
    }
}

struct Archive: View {
    @State private var showingSheet = false
    
        var body: some View {
            Button("Show Sheet") {
                showingSheet.toggle()
            }.sheet(isPresented: $showingSheet) {
                SecondView()
            }
        }
}*/

/*class User: ObservableObject {
    @Published var firstName = "Bilbo"
    @Published var lastName = "Baggins"
}

struct Archive: View {
    @StateObject var user = User()

        var body: some View {
            VStack {
                Text("Your name is \(user.firstName) \(user.lastName).")

                TextField("First name", text: $user.firstName)
                TextField("Last name", text: $user.lastName)
            }
        }
}*/

struct Archive_Previews: PreviewProvider {
    static var previews: some View {
        Archive()
    }
}
