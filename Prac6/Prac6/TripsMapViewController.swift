//
//  TripsMapViewController.swift
//  Prac6
//
//  Created by JULIAN BUTLER on 4/05/2017.
//  Copyright © 2017 JULIAN BUTLER. All rights reserved.
//

import UIKit
import MapKit

class TripsMapViewController: UIViewController, LocationObserver, MKMapViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //
        Utilities.loadTrips()
        
        //
        self.tripsMap.delegate = self
        
        //
        tripsMap.setCenter(tripsMap.userLocation.coordinate, animated: true)
        
        //
        for i in 0 ... Utilities.trips.count - 1
        {
            let trip = Utilities.trips[i]
            
            //
            CLGeocoder().geocodeAddressString(trip.tripDestination, completionHandler: {
                //
                (placeMark, error) in
                let tripLocation = placeMark![0].location?.coordinate
                self.tripsMap.addAnnotation(TripAnnotation(tripId : i, trip: trip, coordinate: tripLocation!))
            })
        }
        
        
        LocationService.shared.registerLocationObserver(locationObserver: self)
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
    
    
    ///photos too big //need constraints, change a setting?
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView?
    {
        //
        let reuseId = "tripAnnotation"
        
        //
        let tripAnnotation : TripAnnotation? = (annotation as? TripAnnotation)
        if tripAnnotation == nil
        {            return nil        }
        
        //
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: reuseId)
        
        //
        if annotationView == nil
        {
            
            annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: reuseId)
            annotationView?.image = tripAnnotation?.img
            let btn = UIButton(type: .detailDisclosure)
            annotationView?.rightCalloutAccessoryView = btn
            annotationView?.canShowCallout = true
        } else {
            annotationView!.annotation = tripAnnotation
        }
        
        return annotationView
    }
    
    
    //problem added. solve above first
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl)
    {
        //
        //
        let selectedTrip = Utilities.trips[(view.annotation as! TripAnnotation).tripId]
        
        //
        //
        let tripInfoVC = (self.storyboard?.instantiateViewController(withIdentifier: "tripInfo") as! TblViewControllerTripInfo)
        
        //
        tripInfoVC.trip = selectedTrip
        
        //
        self.present(tripInfoVC, animated: true, completion: nil)
        
    }
    
    
    func locationDidChange(newLocations: [CLLocation])
    {    self.tripsMap.setCenter(newLocations[0].coordinate, animated: true)    }
}

class LocationService : NSObject, CLLocationManagerDelegate
{
    var locationObservers : [LocationObserver] = []
    var locationManager = CLLocationManager.init()
    static let shared: LocationService = LocationService()
    
    override private init()
    {
        super.init()
        locationManager.desiredAccuracy = 100 //metres
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    func registerLocationObserver(locationObserver : LocationObserver)
    {            locationObservers.append(locationObserver)        }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        //
        for observer in locationObservers
        {
            observer.locationDidChange(newLocations: locations)
        }
    }
}
