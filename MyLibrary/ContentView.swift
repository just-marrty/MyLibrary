//
//  ContentView.swift
//  MyLibrary
//
//  Created by Martin Hrbáček on 07.11.2025.
//

import SwiftUI

struct ContentView: View {
    let library = Library()
    
    @State var searchText = ""
    @State var alphabetical = false
    
    var filterLibrary: [MyLibrary] {
        library.sort(by: alphabetical)
        return library.search(for: searchText)
    }
    
    var body: some View {
        NavigationStack {
            // List odkazuje na MyLibrary.swift
            List(filterLibrary) { library in
                NavigationLink {
                    AuthorView(library: library)
                } label: {
                    // VStack pro autora a národnost z json (také z MyLibrary.swift)
                    VStack(alignment: .leading) {
                        Text(library.author)
                            .font(.title2)
                        
                        Text(library.nationality)
                            .font(.subheadline)
                            .padding(.top, 3)
                    }
                }
            }
            .navigationTitle("Knihovna")
            .searchable(text: $searchText)
            .autocorrectionDisabled()
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        withAnimation {
                            alphabetical.toggle()
                        }
                    } label: {
//                        if alphabetical {
//                            Image(systemName: "person")
//                        } else {
//                            Image(systemName: "textformat")
//                        }
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
