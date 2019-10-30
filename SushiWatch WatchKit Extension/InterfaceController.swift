//
//  InterfaceController.swift
//  SushiWatch WatchKit Extension
//
//  Created by MacStudent on 2019-10-30.
//  Copyright © 2019 MacStudent. All rights reserved.
//

import WatchKit
import Foundation
import WatchConnectivity


class InterfaceController: WKInterfaceController,WCSessionDelegate
{
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        
    }
    

    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
        if WCSession.isSupported() {
            WCSession.default.delegate = self
            WCSession.default.activate()
        }
        
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    
    @IBAction func LeftButtonPressed() {
        
        
        if WCSession.default.isReachable
        {
            print("Attempting to move cat Left")
            
            if WCSession.default.isReachable {
                print("Attempting to send message to phone")
               
                WCSession.default.sendMessage(
                    ["ButtonPressed" : "left"],
                    replyHandler: {
                        (_ replyMessage: [String: Any]) in
                
                        }, errorHandler: { (error) in
                            
                            
                    //@TODO: What do if you get an error
                    print("Error while sending message: \(error)")
                    
                })
            }
            else {
                print("Phone is not reachable")
               
            }
        }
        
    }
    
    
        
    @IBAction func RightButtonPressed()
    
    {
        
    if WCSession.default.isReachable
    {
            print("Attempting to move cat right")
        WCSession.default.sendMessage(
            ["ButtonPressed" : "right"],
            replyHandler: {
                (_ replyMessage: [String: Any]) in
                
        }, errorHandler: { (error) in
            
            
            //@TODO: What do if you get an error
            print("Error while sending message: \(error)")
            
        })
            
        }
        else {
            print("Phone is not reachable")
      
        }
        
    }
        
        
        
        
    }

    
    
    




