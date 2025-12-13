//
//  ContentView.swift
//  MyLibrary
//
//  Created by Martin Hrbáček on 07.11.2025.
//

import SwiftUI

struct ContentView: View {
    let bookService = BookService()
    
    @State private var searchText = ""
    @State private var alphabetical = false
    
    var body: some View {
        NavigationStack {
            List(bookService.search(for: searchText)) { book in
                NavigationLink {
                    AuthorView(book: book)
                } label: {
                    VStack(alignment: .leading) {
                        Text(book.author)
                            .font(.title2)
                        
                        Text(book.nationality)
                            .font(.subheadline)
                            .padding(.top, 3)
                    }
                }
            }
            .navigationTitle("Library")
            .searchable(text: $searchText)
            .animation(.default, value: searchText)
            .autocorrectionDisabled()
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        withAnimation {
                            alphabetical.toggle()
                            bookService.sort(by: alphabetical)
                        }
                    } label: {
                        Image(systemName: alphabetical ? "person" : "textformat")
                            .symbolEffect(.bounce, value: alphabetical)
                    }
                }
            }
        }
        .preferredColorScheme(.dark)
    }
}

#Preview {
    ContentView()
}
