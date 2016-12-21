//
//  ChatMessageCell.swift
//  Messager
//
//  Created by Jay on 19/12/2016.
//  Copyright © 2016 Jay. All rights reserved.
//

import UIKit

class ChatMessageCell: BaseCell {
    
    let messageTextView: UITextView = {
        let tv = UITextView()
        tv.font = UIFont.systemFont(ofSize: 16)
        tv.text = "Sample message"
        tv.translatesAutoresizingMaskIntoConstraints = false
        return tv
    }()
    
    override func setupView() {
        super.setupView()
        
        addSubview(messageTextView)
        messageTextView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        messageTextView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        messageTextView.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        messageTextView.heightAnchor.constraint(equalTo: self.heightAnchor).isActive = true
    }
}
