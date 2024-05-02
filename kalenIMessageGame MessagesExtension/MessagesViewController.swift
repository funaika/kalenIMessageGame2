//
//  MessagesViewController.swift
//  kalenIMessageGame MessagesExtension
//
//  Created by Kalen on 5/2/24.
//

import UIKit
import Messages

class MessagesViewController: MSMessagesAppViewController {
    
    var imagePairs: [UIImage] = []

    
    override func viewDidLoad() {
        super.viewDidLoad()

        let images = ["eggDog512", "sillyCat512", "evilEmoji512", "ermEmoji512"]
        for imageName in images {
            if let image = UIImage(named: imageName) {
                imagePairs.append(image)
                imagePairs.append(image)
            }
        }
        
        // Shuffle image pairs
        imagePairs.shuffle()
    }
    
    func sendGameMove(move: Card) {
        guard let conversation = activeConversation else { return }
        
        let message = MSMessage()
        let layout = MSMessageTemplateLayout()
        // Configure layout with game move information
        
        message.layout = layout
        
        conversation.insert(message) { error in
            if let error = error {
                print("Error sending message: \(error.localizedDescription)")
            }
        }
    }
    
        
        
        
    }
    
    // MARK: - Conversation Handling
    
    func willBecomeActive(with conversation: MSConversation) {
        // Called when the extension is about to move from the inactive to active state.
        // This will happen when the extension is about to present UI.
        
        // Use this method to configure the extension and restore previously stored state.
    }
    
    func didResignActive(with conversation: MSConversation) {
        // Called when the extension is about to move from the active to inactive state.
        // This will happen when the user dismisses the extension, changes to a different
        // conversation or quits Messages.
        
        // Use this method to release shared resources, save user data, invalidate timers,
        // and store enough state information to restore your extension to its current state
        // in case it is terminated later.
    }
   
    func didReceive(_ message: MSMessage, conversation: MSConversation) {
        guard let messageURL = message.url else { return }    }
    
    func didStartSending(_ message: MSMessage, conversation: MSConversation) {
        // Called when the user taps the send button.
    }
    
    func didCancelSending(_ message: MSMessage, conversation: MSConversation) {
        // Called when the user deletes the message without sending it.
    
        // Use this to clean up state related to the deleted message.
    }
    
    func willTransition(to presentationStyle: MSMessagesAppPresentationStyle) {
        // Called before the extension transitions to a new presentation style.
    
        // Use this method to prepare for the change in presentation style.
    }
    
    func didTransition(to presentationStyle: MSMessagesAppPresentationStyle) {
        // Called after the extension transitions to a new presentation style.
    
        // Use this method to finalize any behaviors associated with the change in presentation style.
    }


