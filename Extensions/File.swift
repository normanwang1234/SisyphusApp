//
//  File.swift
//  Sisyphus
//
//  Created by Norman Wang on 1/25/20.
//  Copyright © 2020 Norman Wang. All rights reserved.
//

import UIKit

extension UIView{
    func pin(to superView: UIView)
    {
        translatesAutoresizingMaskIntoConstraints = false
        topAnchor.constraint(equalTo: superView.topAnchor).isActive = true
        leadingAnchor.constraint(equalTo: superView.leadingAnchor).isActive = true
        trailingAnchor.constraint(equalTo: superView.trailingAnchor).isActive = true
        bottomAnchor.constraint(equalTo: superView.bottomAnchor).isActive = true
    }
}
