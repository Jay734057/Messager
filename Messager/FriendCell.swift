//
//  FriendCell.swift
//  Messager
//
//  Created by Jay on 17/12/2016.
//  Copyright © 2016 Jay. All rights reserved.
//

import UIKit

class FriendCell: BaseCell {
    
    var message: Message? {
        didSet{
            nameLabel.text = message?.friend?.name
            if let imageName = message?.friend?.profileImageName {
                profileImageView.image = UIImage(named: imageName)
                hasReadImageView.image = UIImage(named: imageName)
            }
            
            messageLabel.text = message?.text
            
            if let date = message?.date {
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "h:mm a"
                
                timeLabel.text = dateFormatter.string(from: date as Date)
            }
            
        }
    }
    
    
    
    let profileImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "zuckprofile")
        iv.contentMode = .scaleAspectFill
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.layer.cornerRadius = 32
        iv.layer.masksToBounds = true
        return iv
    }()
    
    let separatorView: UIView = {
        let v = UIView()
        v.backgroundColor = UIColor(white: 0.5, alpha: 0.5)
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    let containerView: UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
//        v.backgroundColor = UIColor.red
        return v
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "my friend"
        label.font = UIFont.systemFont(ofSize: 18)
        return label
    }()
    
    let messageLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "my friend's message and something else and i dont know"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = UIColor.darkGray
        return label
    }()
    
    let timeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "12:05 pm"
        label.textColor = UIColor.darkGray
        label.font = UIFont.systemFont(ofSize: 14)
        label.textAlignment = .right
        return label
    }()

    let hasReadImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "zuckprofile")
        iv.contentMode = .scaleAspectFill
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.layer.cornerRadius = 10
        iv.layer.masksToBounds = true
        return iv
    }()

    
    override func setupView() {
        
        addSubview(profileImageView)
        //x,y,w,h
        profileImageView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 12).isActive = true
        profileImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        profileImageView.widthAnchor.constraint(equalToConstant: 64).isActive = true
        profileImageView.heightAnchor.constraint(equalToConstant: 64).isActive = true
        
        addSubview(separatorView)
        //x,y,w,h
        separatorView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        separatorView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        separatorView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 76).isActive = true
        separatorView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        setupContrainerView()
    }
    
    private func setupContrainerView() {
        addSubview(containerView)
        //x,y,w,h
        containerView.leftAnchor.constraint(equalTo: profileImageView.rightAnchor, constant: 20).isActive = true
        containerView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        containerView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        containerView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        addSubview(hasReadImageView)
        //x,y,w,h
        
        hasReadImageView.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -12).isActive = true
        hasReadImageView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: 0).isActive = true
        hasReadImageView.widthAnchor.constraint(equalToConstant: 20).isActive = true
        hasReadImageView.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        containerView.addSubview(messageLabel)
        //x,y,w,h
        messageLabel.leftAnchor.constraint(equalTo: containerView.leftAnchor).isActive = true
        messageLabel.rightAnchor.constraint(equalTo: hasReadImageView.leftAnchor, constant: -12).isActive = true
        messageLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor).isActive = true
        messageLabel.heightAnchor.constraint(equalToConstant: 24).isActive = true
        
        containerView.addSubview(nameLabel)
        //x,y,w,h
        nameLabel.leftAnchor.constraint(equalTo: containerView.leftAnchor).isActive = true
        nameLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
        nameLabel.topAnchor.constraint(equalTo: containerView.topAnchor).isActive = true
        nameLabel.bottomAnchor.constraint(equalTo: messageLabel.topAnchor).isActive = true
        
        containerView.addSubview(timeLabel)
        timeLabel.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -12).isActive = true
        timeLabel.widthAnchor.constraint(equalToConstant: 120).isActive = true
        timeLabel.topAnchor.constraint(equalTo: containerView.topAnchor).isActive = true
        timeLabel.bottomAnchor.constraint(equalTo: messageLabel.topAnchor).isActive = true
        
    }
}
