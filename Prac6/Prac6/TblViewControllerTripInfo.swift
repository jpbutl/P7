//
//  TblViewControllerTripInfo.swift
//  Prac7
//
//  Created by JULIAN BUTLER on 20/04/2017.
//  Copyright © 2017 JULIAN BUTLER. All rights reserved.
//

import Foundation
import UIKit

class TblViewControllerTripInfo : UITableViewController
{
    var trip : Trip?
    
    @IBOutlet weak var tripDate: UITextField!
    @IBOutlet weak var tripDuration: UITextField!
    @IBOutlet weak var tripDestination: UITextField!
    
    //save changes if the user modified the trip date
    @IBAction func saveTripInfo(_ sender: Any) {
        trip!.tripDate = Utilities.dateFormatter.date(from: tripDate.text!)!
        trip!.tripDuration = Int(tripDuration.text!)!
        trip!.tripDestination = tripDestination.text!
    }
    
    //set the trip details as passed from the trips list view
    override func viewWillAppear(_ animated: Bool) {
        if trip != nil {
            tripDate.text = Utilities.dateFormatter.string(for: trip!.tripDate)
            tripDestination.text  = trip!.tripDestination
            tripDuration.text = "\(trip!.tripDuration)"
        }
    }
}
