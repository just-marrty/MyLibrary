//
//  MyLibrary.swift
//  MyLibrary
//
//  Created by Martin Hrbáček on 07.11.2025.
//

import SwiftUI

struct MyLibrary: Decodable, Identifiable {
    let id: Int
    let author: String
    let nationality: String
    let title: String
    let description: String
}
