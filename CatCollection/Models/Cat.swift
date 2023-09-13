//
//  Cat.swift
//  CatCollection
//
//  Created by Kima on 12.09.2023.
//

import Foundation

struct Cat: Decodable {
    let id: String
    let url: URL
    let width: Int
    let height: Int
}

struct Cats: Decodable {
    let cats: [Cat]
}


