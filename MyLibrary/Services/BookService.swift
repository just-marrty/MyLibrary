//
//  BookService.swift
//  MyLibrary
//
//  Created by Martin Hrbáček on 07.11.2025.
//

import Foundation

class BookService {
    
    var allBooksData: [Book] = []
    var booksData: [Book] = []
    
    init() {
        decodeBooksData()
    }
    
    func decodeBooksData() {
        if let url = Bundle.main.url(forResource: "books", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
            
                allBooksData = try decoder.decode([Book].self, from: data)
                booksData = allBooksData
            } catch {
                print("Error decoding JSON data: \(error)")
            }
        }
    }
    
    func search(for searchTerm: String) -> [Book] {
        if searchTerm.isEmpty {
            return booksData
        } else {
            return booksData.filter { book in
                book.author
                    .localizedCaseInsensitiveContains(searchTerm)
            }
        }
    }
    
    func sort(by alphabetical: Bool) {
        booksData.sort { book1, book2 in
            if alphabetical {
                book1.author < book2.author
            } else {
                book1.id < book2.id
            }
        }
    }
}
