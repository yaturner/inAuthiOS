//
//  GPSViewController.swift
//  inAuth
//
//  Created by Jim Turner on 5/27/17.
//  Copyright © 2017 Jim Turner. All rights reserved.
//

import UIKit
import Foundation
import CoreLocation
import AVFoundation

class GPSViewController: UIViewController, CLLocationManagerDelegate, AVCaptureMetadataOutputObjectsDelegate {
  @IBOutlet weak var GPSTextView: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()
          }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    AppDelegate.shared().enableLocationManager()
    if let currentLocation:  CLLocation?  = AppDelegate.shared().currentLocation {
      let latitude: Double = currentLocation!.coordinate.latitude
      let longitude: Double = currentLocation!.coordinate.longitude
      let GoldenGateBridge = CLLocation(latitude: 37.8199, longitude: -122.4783)
      let distance: Double = (currentLocation?.distance(from: GoldenGateBridge))! * 0.000621371

    print(currentLocation!.coordinate.latitude, currentLocation!.coordinate.longitude)
      GPSTextView.text = "You are at latitude: \(latitude),  longitude: \(longitude)\nYou are \(distance) miles from the Golden Gate Bridge"
    }
    else {
      print("Can't get current location")
    }

  }
  
    
  
  
  
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
