//
//  AppDelegate.swift
//  inAuth
//
//  Created by Jim Turner on 5/27/17.
//  Copyright © 2017 Jim Turner. All rights reserved.
//


import UIKit
import Foundation
import CoreLocation
import AVFoundation


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, CLLocationManagerDelegate, AVCaptureMetadataOutputObjectsDelegate {

  var window: UIWindow?
  var locationManager: CLLocationManager!
  var currentLocation: CLLocation!
  
  class public func shared() -> AppDelegate
  {
    return UIApplication.shared.delegate as! AppDelegate
  }
  

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
    // Override point for customization after application launch.
        return true
  }

  func applicationWillResignActive(_ application: UIApplication) {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
  }

  func applicationDidEnterBackground(_ application: UIApplication) {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
  }

  func applicationWillEnterForeground(_ application: UIApplication) {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
  }

  func applicationDidBecomeActive(_ application: UIApplication) {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
  }

  func applicationWillTerminate(_ application: UIApplication) {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
  }

  public func enableLocationManager()
  {
    
    
    locationManager = CLLocationManager()
    
    if (CLLocationManager.locationServicesEnabled())
    {
      locationManager.delegate = self
      locationManager.desiredAccuracy = kCLLocationAccuracyBest
//      locationManager.requestWhenInUseAuthorization()
//      locationManager.requestAlwaysAuthorization()
      locationManager.startUpdatingLocation()
      if ((UIDevice.current.systemVersion as NSString).floatValue >= 8)
      {
        locationManager.requestWhenInUseAuthorization()
      }
      
      locationManager.startUpdatingLocation()
      
      currentLocation = self.locationManager.location
            
    }
    else
    {
      #if debug
        println("Location services are not enabled");
      #endif
    }
    
  }
  
  func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!)
  {
    let locationArray = locations as NSArray
    let locationObj = locationArray.lastObject as! CLLocation
    let coord = locationObj.coordinate
    print(coord.latitude)
    print(coord.longitude)
    
  }

  
     }



