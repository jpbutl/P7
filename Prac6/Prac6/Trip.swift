//
//  Trip.swift
//  Prac7
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
    
    
    static func resizeImage2(image: UIImage, newWidth: CGFloat) -> UIImage? {
        
        let scale = newWidth / image.size.width
        let newHeight = image.size.height * scale
        UIGraphicsBeginImageContext(CGSize(width: newWidth, height: newHeight))
        image.draw(in: CGRect(x: 0, y: 0, width: newWidth, height: newHeight))
        
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage
    }

    
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
        
        //RESIZE IMAGES
        
        var melImg : UIImage = UIImage(named: "melbourne.jpg")!
        var sydImg : UIImage = UIImage(named: "sydney.jpeg")!
        
        melImg = Trip.resizeImage2(image: melImg, newWidth: CGFloat(50))!
        sydImg = Trip.resizeImage2(image: sydImg, newWidth: CGFloat(50))!
        
        
        trips =
        [
            Trip(date : dateFormatter.date(from: "17/04/24")!, duration : 2, destination : "Melbourne" , img : melImg),
            Trip(date : dateFormatter.date(from: "17/05/24")!, duration : 2, destination : "Sydney", img : sydImg)
        ]
        //refer to file as .jpg/.jpeg's
        
        
        //instead of modifying img in trips struct above, change it only when it's displayed in map view
    }
}


//var melbourneImg : UIImage
//melbourneImg = UIImage(named: "melbourne.jpg")!

//melbourneImg = self.resizeImage(UIImage(named: "melbourne.jpg")!, 50.0)


// http://stackoverflow.com/questions/31966885/ios-swift-resize-image-to-200x200pt-px

// Learn Swift: Scale Images Keep Aspect Ratio!
// https://www.youtube.com/watch?v=wXDkZqmXVBs

// http://stackoverflow.com/questions/24795035/swift-extra-argument-in-call


// melbourne10p.jpg  is 50% of 10%  //Redo with higher image quality
