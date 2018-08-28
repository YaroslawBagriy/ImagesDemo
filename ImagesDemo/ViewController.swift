//
//  ViewController.swift
//  ImagesDemo
//
//  Created by Yaroslaw Bagriy on 4/10/16.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var placeholder: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // define image url
        let url = URL(string: "http://www.iphonefaq.org/images/archives/wallpaper-iphone4.jpg")
        
        // create a task to download and process it
        let task = URLSession.shared.dataTask(with: url!, completionHandler: { (data, response, error) -> Void in
            
            if data != nil {
                
                DispatchQueue.main.async(execute: { () -> Void in
                    
                    // place code to run on main thread here
                    
                    if let background = UIImage(data: data!) {
                        
                        self.placeholder.image = background
                        
                    }
                    
                })
                
            } else {
                
                print(error)
                
            }
            
        }) 
        
        task.resume()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

