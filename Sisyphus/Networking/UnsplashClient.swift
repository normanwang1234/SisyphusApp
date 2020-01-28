//
//  UnsplashClient.swift
//  Sisyphus
//
//  Created by Norman Wang on 1/27/20.
//  Copyright © 2020 Norman Wang. All rights reserved.
//

import Foundation

class UnsplashClient: APIClient {
    static let baseUrl = "https://api.unsplash.com"
    static let apiKey = "f4c8bd8a2ad62a915157d32093ea5f260e532c1bb4ce76f5e8110ecf22552b70"
    
    func fetch(with endpoint: UnsplashEndpoint, completion: @escaping (Either<Photos>) -> Void) {
        let request = endpoint.request
        get(with: request, completion: completion)
    }
}
