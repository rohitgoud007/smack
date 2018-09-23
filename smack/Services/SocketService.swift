//
//  SocketService.swift
//  smack
//
//  Created by Rohit Goud on 23/09/18.
//  Copyright © 2018 Rohit Goud. All rights reserved.
//

import UIKit
import SocketIO

class SocketService: NSObject {

    static let instance = SocketService()
    
    let manager: SocketManager //managing multiple clients at once
    let socket: SocketIOClient //actual socket
    
    override init() {
        //initialiing socket as this class initializes
        self.manager = SocketManager(socketURL: URL(string: BASE_URL)!)
        self.socket = manager.defaultSocket
        super.init()
        
    }
}
