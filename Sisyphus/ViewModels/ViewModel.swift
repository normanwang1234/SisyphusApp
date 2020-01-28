//
//  ViewModel.swift
//  Sisyphus
//
//  Created by Norman Wang on 1/27/20.
//  Copyright © 2020 Norman Wang. All rights reserved.
//

import UIKit

struct CellViewModel {
    let image: UIImage
}
class ViewModel {
    //MARK: Properties
    private let client:APIClient
    private var photos: Photos = [] {
        didSet {
            self.fetchPhoto()
        }
    }
    var cellViewModels: [CellViewModel] = []
    
    //MARK: UI
    var isLoading: Bool = false {
        didSet {
            showLoading?()
        }
    }
    var showLoading: (() -> Void)?
    var reloadData: (() -> Void)?
    var showError: ((Error) ->Void)?
    
    init(client: APIClient) {
        self.client = client
        
    }
    
    func fetchPhotos() {
        if let client = client as? UnsplashClient {
            self.isLoading = true
            let endpoint = UnsplashEndpoint.photos(id: UnsplashClient.apiKey, order: .latest)
            client.fetch(with: endpoint) {(either) in
                switch either {
                case .success(let photos):
                    self.photos = photos
                case .error(let error):
                    self.showError?(error)
                }
                
            }
        }
    }
    
    private func fetchPhoto() {
        let group = DispatchGroup()
        
        self.photos.forEach { (photos) in
            DispatchQueue.global(qos: .background).async(group: group) {
                group.enter()
                guard let imageData = try? Data(contentsOf: photos.urls.small) else {
                    self.showError?(APIError.imageDownload)
                    return
                }
                guard let image = UIImage(data: imageData) else {
                    self.showError?(APIError.imageConvert)
                    return
                }
                
                self.cellViewModels.append(CellViewModel(image: image))
                group.leave()
            }
        }
        group.notify(queue: .main) {
            self.isLoading = false
            self.reloadData?()
        }
    }
    
}
