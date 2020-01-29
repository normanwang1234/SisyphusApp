//
//  HomeViewController.swift
//  Sisyphus
//
//  Created by Norman Wang on 1/28/20.
//  Copyright © 2020 Norman Wang. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    //MARK - Outlets
    @IBOutlet weak var collectionView: UICollectionView!
    
    //MARK - Properties
    let images = [UIImage(named: "home1"),
                  UIImage(named: "home2"),
                  UIImage(named: "home3"),
                  UIImage(named: "home4"),
                  UIImage(named: "home5")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let logoContainer = UIView(frame: CGRect(x: 0, y: 10, width: 350, height: 70))

        let imageView = UIImageView(frame: CGRect(x: 0, y: 10, width: 350, height: 70))
        imageView.contentMode = .scaleAspectFit
        let image = UIImage(named: "SisyphusLogo")
        imageView.image = image
        logoContainer.addSubview(imageView)
        navigationItem.titleView = logoContainer
        
        
        //self.collectionView.isScrollEnabled = false;
        // Do any additional setup after loading the view.
    }

}
//MARK - Flow Layout Delegate
extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let numberOfColumns: CGFloat = 3
        let width = collectionView.frame.size.width
        let xInsets: CGFloat = 10
        let cellSpacing: CGFloat = 5
        
        
        return CGSize(width: (width/numberOfColumns) - (xInsets+cellSpacing), height: (width/numberOfColumns) - (xInsets+cellSpacing))
        
    }
    

}

//MARK - Data Source

extension HomeViewController : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCell", for: indexPath) as! HomeCell
        
        let image = images[indexPath.item]
        cell.imageView.image = image
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
}
