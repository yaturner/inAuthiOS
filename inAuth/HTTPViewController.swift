//
//  HTTPViewController.swift
//  inAuth
//
//  Created by Jim Turner on 5/27/17.
//  Copyright © 2017 Jim Turner. All rights reserved.
//

import UIKit
import Foundation

class HTTPViewController: UIViewController, UITextViewDelegate {

  @IBOutlet weak var jsonTextView: UITextView!
  var pretty :String?
  
    override func viewDidLoad() {
        super.viewDidLoad()
      
      let url = URL(string: "https://api.data.gov/regulations/v3/documents?api_key=fLXwNeCqYRPk2oxDqjWGg4iI4lC7oohnnQTEzIPB&rpp=25&po=0&dct=PR%252BFR&pd=09%257C01%257C14-09%257C30%257C14&encoded=1")
      //let accountEmail = "thejmturner@gmail.com"
      //let accountID = "2b71342e-92fa-4f98-bcca-f0cd00b9331d"
      //let accountApiKey = "fLXwNeCqYRPk2oxDqjWGg4iI4lC7oohnnQTEzIPB"
      
    jsonTextView.delegate = self
      
      
      URLSession.shared.dataTask(with:url!, completionHandler: {(data, response, error) in
        guard let data = data, error == nil else { return }
        
          do {
            let json = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as! [String:Any]
            self.pretty = self.JSONStringify(value: json as AnyObject, prettyPrinted: true)
            DispatchQueue.main.async {
                self.setJsonView(string: self.pretty!)
            }
          } catch let error as NSError {
            print(error)
          }
        }).resume()
      

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    
      }
  
  func setJsonView(string: String)
  {
    if let pretty = pretty {
      self.jsonTextView.text = pretty
    }
  }
  
  
  func JSONStringify(value: AnyObject,prettyPrinted:Bool = false) -> String{
    
    let options = prettyPrinted ? JSONSerialization.WritingOptions.prettyPrinted : JSONSerialization.WritingOptions(rawValue: 0)
    
    
    if JSONSerialization.isValidJSONObject(value) {
      
      do{
        let data = try JSONSerialization.data(withJSONObject: value, options: options)
        if let string = NSString(data: data, encoding: String.Encoding.utf8.rawValue) {
          return string as String
        }
      }catch {
        
        print("error")
        //Access error here
      }
      
    }
    return ""
    
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
