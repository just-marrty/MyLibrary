//
//  Library.swift
//  MyLibrary
//
//  Created by Martin Hrbáček on 07.11.2025.
//

import Foundation

class Library {
    
    var allMyLibrary: [MyLibrary] = []
    var myLibrary: [MyLibrary] = []
    
    init() {
        decodeLibraryData()
    }
    
    func decodeLibraryData() {
        if let url = Bundle.main.url(forResource: "library", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
            
                allMyLibrary = try decoder.decode([MyLibrary].self, from: data)
                myLibrary = allMyLibrary
            } catch {
                print("Error decoding JSON data: \(error)")
            }
        }
    }
    
    func search(for searchTerm: String) -> [MyLibrary] {
        if searchTerm.isEmpty {
            return myLibrary
        } else {
            return myLibrary.filter { library in
                library.author
                    .localizedCaseInsensitiveContains(searchTerm)
            }
        }
    }
    
    func sort(by alphabetical: Bool) {
        myLibrary.sort { library1, library2 in
            if alphabetical {
                library1.author < library2.author
            } else {
                library1.id < library2.id
            }
        }
    }
}
