//
//  ContentView-ViewModel.swift
//  Acquaintly
//
//  Created by Mitch on 12/21/22.
//

import Foundation

class ViewModel: ObservableObject {
    @Published var people: [Person]
    
    let savePath = FileManager.documentsDirectory.appendingPathComponent("SavedPeopple")
    
    init() {
        do {
            let data = try Data(contentsOf: savePath)
            people = try JSONDecoder().decode([Person].self, from: data).sorted()
        } catch {
            people = []
        }
    }
    
    func save() {
        do {
            let data = try JSONEncoder().encode(people)
            try data.write(
                to: savePath,
                options: [.atomic, .completeFileProtection]
            )
        } catch {
            print("Unable to save data.")
        }
    }
    
    func addPerson(_ person: Person) {
        people.append(person)
        people.sort()
        save()
    }
    
    func removePerson(at offsets: IndexSet) {
        people.remove(atOffsets: offsets)
        save()
    }
}
