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
    
    
    func resizeImage(image: UIImage, newWidth: CGFloat) -> UIImage? {
        
        let scale = newWidth / image.size.width
        let newHeight = image.size.height * scale
        UIGraphicsBeginImageContext(CGSize(width: newWidth, height: newHeight))
        image.draw(in: CGRect(x: 0, y: 0, width: newWidth, height: newHeight))
        
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage
    }
    
    static func loadTrips()
    {
        dateFormatter.dateFormat = "yy/mm/dd"
        
        //RESIZE IMAGES
        
        //var melbourneImg : UIImage
        //melbourneImg = UIImage(named: "melbourne.jpg")!
        
        //melbourneImg = self.resizeImage(UIImage(named: "melbourne.jpg")!, 50.0)


        // http://stackoverflow.com/questions/31966885/ios-swift-resize-image-to-200x200pt-px
        
        // Learn Swift: Scale Images Keep Aspect Ratio!

        // https://www.youtube.com/watch?v=wXDkZqmXVBs
        
        // http://stackoverflow.com/questions/24795035/swift-extra-argument-in-call
        
        
        // melbourne.jpg
        // sydney.jpeg
        
        // melbourne10p.jpg  is 50% of 10%  //Redo with higher image quality
        
        trips =
        [
            Trip(date : dateFormatter.date(from: "17/04/24")!, duration : 2, destination : "Melbourne" , img : UIImage(named: "melbourne10p.jpg")!),
            Trip(date : dateFormatter.date(from: "17/05/24")!, duration : 2, destination : "Sydney", img : UIImage(named: "sydney10p.jpeg")!)
        ]
        //refer to file as .jpg/.jpeg's
    }
}


