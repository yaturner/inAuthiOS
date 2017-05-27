//
//  HTTPViewController.swift
//  inAuth
//
//  Created by Jim Turner on 5/27/17.
//  Copyright © 2017 Jim Turner. All rights reserved.
//

import UIKit

class HTTPViewController: UIViewController {

  @IBOutlet weak var jsonTextView: UITextView!
  
    override func viewDidLoad() {
        super.viewDidLoad()

      self.jsonTextView.text = "Hello World"

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    
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
