//
//  ServerError.swift
//  autolayout_lbta
//
//  Created by Erik Magnusson on 2018-06-22.
//  Copyright © 2018 Simon Riemertzon. All rights reserved.
//

import Darwin

enum ServerError: Int, Error {
	case noConnection = 1
	case authenicationFailed = 2
	case serverNotFound = 3
	
	func message()  {
		switch self {
		case .noConnection:  print("Your internet is not working")
		case .authenicationFailed:  print("You are not authinicated")
		case .serverNotFound:  print("The server was not found")
		}
	}
}

func connectToServer(serverNumber: Int) {
	if let serverNumber = ServerError.init(rawValue: serverNumber) {
		serverNumber.message()
	} else {
		print("You connected to server successfully")
	}
}
