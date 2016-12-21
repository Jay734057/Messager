//
//  FriendControllerExtension.swift
//  Messager
//
//  Created by Jay on 18/12/2016.
//  Copyright © 2016 Jay. All rights reserved.
//

import UIKit
import CoreData

extension FriendsController{
    
    func clearData() {
        let delegate = UIApplication.shared.delegate as? AppDelegate
        
        if let context = delegate?.persistentContainer.viewContext {
            
            do {
                
                let entityNames = ["Friend","Message"]
                
                for entityName in entityNames {
                    let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: entityName)
                    let objects = try(context.fetch(fetchRequest)) as? [NSManagedObject]
                    
                    for object in objects! {
                        context.delete(object)
                    }

                }
                
                
                try(context.save())
                
            }catch let err {
                print(err)
            }
        }
    }
    
    func setupData() {
        
        clearData()
        
        let delegate = UIApplication.shared.delegate as? AppDelegate
        
        if let context = delegate?.persistentContainer.viewContext {
            
            let friend = NSEntityDescription.insertNewObject(forEntityName: "Friend", into: context) as! Friend
            friend.name = "Mark Zuckerberg"
            friend.profileImageName = "zuckprofile"
            
            let message = NSEntityDescription.insertNewObject(forEntityName: "Message", into: context) as! Message
            message.friend = friend
            message.text = "Hello, my name is Mark, Nice to meet you"
            message.date = NSDate()
            
            let friend1 = NSEntityDescription.insertNewObject(forEntityName: "Friend", into: context) as! Friend
            friend1.name = "Steve Jobs"
            friend1.profileImageName = "steveprofile"
            
            let friend2 = NSEntityDescription.insertNewObject(forEntityName: "Friend", into: context) as! Friend
            friend2.name = "Donald Trump"
            friend2.profileImageName = "donald_trump_profile"

            
            createMessageWithText(text: "Good morning...", friend: friend1, minuteAgo: 3,context: context)
            createMessageWithText(text: "Are you interested in the new apple product", friend: friend1, minuteAgo: 2, context: context)
            createMessageWithText(text: "It is so cool righ?t", friend: friend1, minuteAgo: 1, context: context)
            
            createMessageWithText(text: "you are fired", friend: friend2, minuteAgo: 5, context: context)
            
            
            do {
                try(context.save())
            }catch let err {
                print(err)
            }
            
        }
        
        loadData()
        
    }
    
    func createMessageWithText(text: String, friend: Friend, minuteAgo: Double, context: NSManagedObjectContext){
        let message = NSEntityDescription.insertNewObject(forEntityName: "Message", into: context) as! Message
        message.friend = friend
        message.text = text
        message.date = NSDate().addingTimeInterval( -minuteAgo * 60)

    }
    
    
    
    func loadData() {
        let delegate = UIApplication.shared.delegate as? AppDelegate
        
        if let context = delegate?.persistentContainer.viewContext {
            
            if let friends = fetchFriends() {
                
                messages = [Message]()
                
                for friend in friends {
                    print(friend.name)
                    
                    let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Message")
                    
                    fetchRequest.sortDescriptors = [NSSortDescriptor(key: "date", ascending: false)]
                    fetchRequest.predicate = NSPredicate(format: "friend.name = %@", friend.name!)
                    fetchRequest.fetchLimit = 1
                    
                    do {
                        let fetchedMsg = try(context.fetch(fetchRequest) as? [Message])
                        messages?.append(contentsOf: fetchedMsg!)
                    }catch let err {
                        print(err)
                    }
                }
                
                messages = messages?.sorted(by: {$0.date!.compare($1.date! as Date) == .orderedDescending})
            }
        }
    }
    
    func fetchFriends() -> [Friend]? {
        let delegate = UIApplication.shared.delegate as? AppDelegate
        
        if let context = delegate?.persistentContainer.viewContext {
            let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Friend")
            do {
                return try (context.fetch(request) as? [Friend])
            }catch let err {
                print(err)
            }
        }
        return nil
    }

}








