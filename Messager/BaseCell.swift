//
//  BaseCell.swift
//  Messager
//
//  Created by Jay on 17/12/2016.
//  Copyright © 2016 Jay. All rights reserved.
//

import UIKit

class BaseCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
    
    }
}
