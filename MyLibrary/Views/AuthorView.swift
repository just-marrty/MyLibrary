//
//  AuthorView.swift
//  MyLibrary
//
//  Created by Martin Hrbáček on 07.11.2025.
//

import SwiftUI

struct AuthorView: View {
    let book: Book
    
    var body: some View {
        ScrollView {
            VStack (alignment: .leading) {
                Text(book.author)
                    .font(.largeTitle)
                    .bold()
                
                Text(book.title)
                    .font(.title)
                    .padding(.top)
                
                Text(book.description)
                    .padding(.top)
            }
            .padding()
        }
    }
}

#Preview {
    AuthorView(book: BookService().booksData[2])
}
