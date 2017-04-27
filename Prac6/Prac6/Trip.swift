//
//  Trip.swift
//  Prac6
//
//  Created by JULIAN BUTLER on 20/04/2017.
//  Copyright © 2017 JULIAN BUTLER. All rights reserved.
//

import Foundation
import UIKit

class Trip
{
    var tripDate : Date
    var tripDuration : Int
    var tripDestination : String
    var destinationImage : UIImage
    
    init(date : Date, duration : Int, destination: String, img : UIImage)
    {
        self.tripDate = date
        self.tripDuration = duration
        self.tripDestination = destination
        self.destinationImage = img
    }
}


class Utilities
{
    static var dateFormatter = DateFormatter()
    static var trips : [Trip] = []
    static func loadTrips()
    {
        dateFormatter.dateFormat = "yy/mm/dd"
        trips =
        [
            Trip(date : dateFormatter.date(from: "17/04/24")!, duration : 2, destination : "Melbourne" , img : UIImage(named: "melbourne.jpg")!),
            Trip(date : dateFormatter.date(from: "17/05/24")!, duration : 2, destination : "Sydney", img : UIImage(named: "sydney.jpeg")!)
        ]
        //refer to file as .jpg/.jpeg's
    }
}
