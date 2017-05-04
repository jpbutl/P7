//
//  TripsMapViewController.swift
//  Prac6
//
//  Created by JULIAN BUTLER on 4/05/2017.
//  Copyright © 2017 JULIAN BUTLER. All rights reserved.
//

import UIKit
import MapKit

class TripsMapViewController: UIViewController, MKMapViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    @IBOutlet weak var tripsMap: MKMapView!
}
