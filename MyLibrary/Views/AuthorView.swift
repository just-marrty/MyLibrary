//
//  AuthorView.swift
//  MyLibrary
//
//  Created by Martin Hrbáček on 07.11.2025.
//

import SwiftUI

struct AuthorView: View {
    let library: MyLibrary
    
    var body: some View {
        ScrollView {
            VStack (alignment: .leading) {
                Text(library.author)
                    .font(.largeTitle)
                
                Text(library.title)
                    .font(.subheadline)
                    .padding(.top)
                
                Text(library.description)
                    .padding(.top)
            }
            .padding()
        }
    }
}

#Preview {
    AuthorView(library: Library().myLibrary[2])
}
