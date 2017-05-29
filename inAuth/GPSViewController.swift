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


extension NSMutableAttributedString {
  @discardableResult func bold(text:String, textSize:CGFloat) -> NSMutableAttributedString {
    let attrsBold = [NSFontAttributeName : UIFont.boldSystemFont(ofSize: textSize)]
    let boldString = NSMutableAttributedString(string:"\(text)", attributes:attrsBold)
    self.append(boldString)
    return self
  }
  @discardableResult func italic(text:String, textSize:CGFloat) -> NSMutableAttributedString {
    let attrsItalic = [NSFontAttributeName: UIFont.italicSystemFont(ofSize: textSize)]
    let boldString = NSMutableAttributedString(string:"\(text)", attributes:attrsItalic)
    self.append(boldString)
    return self
  }
  
  @discardableResult func normal(text:String, textSize:CGFloat )->NSMutableAttributedString {
    let attrsNormal = [NSFontAttributeName: UIFont.systemFont(ofSize: textSize)]
    let normalString = NSMutableAttributedString(string:"\(text)", attributes:attrsNormal)
    self.append(normalString)
    return self
  }
}

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
      let str1 = "You are at \nlatitude: "
      let str2 = "\(latitude)"
      let str3 = "\nlongitude: "
      let str4 = "\(longitude)"
      let str5 = "\nYou are "
      let str6 = "\(distance)"
      let str7 = " miles from the Golden Gate Bridge"
      
      
      
      
      
      
      let str = NSMutableAttributedString()
        .normal(text:str1, textSize:20)
        .italic(text:str2, textSize: 20)
        .normal(text:str3, textSize: 20)
        .italic(text:str4, textSize:20)
        .normal(text:str5, textSize: 20)
        .bold(text:str6,   textSize:20)
        .normal(text:str7, textSize: 20)
      
      GPSTextView.attributedText = str
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
