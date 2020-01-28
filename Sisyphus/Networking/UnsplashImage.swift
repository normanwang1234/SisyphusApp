//
//  UnsplashImage.swift
//  Sisyphus
//
//  Created by Norman Wang on 1/27/20.
//  Copyright © 2020 Norman Wang. All rights reserved.
//

import Foundation

typealias Photos = [Photo]

struct Photo: Codable {
    let id: String
    let urls: URLS
}
//Use struct or class for dict, enum for single

struct URLS: Codable {
    let raw: URL
    let full: URL
    let regular: URL
    let small: URL
    let thumb: URL
}


