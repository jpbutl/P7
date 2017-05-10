//
//  TripAnnotation.swift
//  Prac6
//
//  Created by JULIAN BUTLER on 10/05/2017.
//  Copyright © 2017 JULIAN BUTLER. All rights reserved.
//

import Foundation
//import UIKit
import MapKit

class TripAnnotation : NSObject, MKAnnotation
{
    var tripId : Int
    var title: String?
    var subtitle: String?
    var coordinate: CLLocationCoordinate2D
    var img : UIImage?
    
    init(tripId : Int, trip : Trip, coordinate: CLLocationCoordinate2D)
    {
        self.tripId = tripId
        self.title = trip.tripDestination
        self.subtitle = "\(trip.tripDate)"
        self.coordinate = coordinate
        self.img = trip.destinationImage
    }
}
