//
//  LocationService.swift
//  Prac6
//
//  Created by JULIAN BUTLER on 10/05/2017.
//  Copyright © 2017 JULIAN BUTLER. All rights reserved.
//

import Foundation
import MapKit


protocol LocationObserver {
    func locationDidChange(newLocations : [CLLocation])
}
