//
//  BackController.swift
//  SampleApp
//
//  Created by Taiwo Adebayo on 17/03/2020.
//  Copyright © 2020 Taiwo Adebayo. All rights reserved.
//

import UIKit
import Alamofire

class SecondController: UIViewController {

     @IBOutlet weak var scrollView: UIScrollView!
    var images = [UIImageView]()
       var contentWidth : CGFloat = 0.0
    override func viewDidLoad() {
        super.viewDidLoad()

        var contentWidth : CGFloat = 0.0
     
        for x in 0...2 {
            
//            let scrollWidth = scrollView.frame.size.width
            
            let image = UIImage(named: "icon\(x+1).jpg")
            let imageView = UIImageView(image: image)
            images.append(imageView)
            
            var newX : CGFloat = 0.0
            
            newX = (scrollView.frame.size.width/2) - 40 + scrollView.frame.size.width * CGFloat(x)
        
            contentWidth += newX
            
            scrollView.addSubview(imageView)

            imageView.frame = CGRect(x:newX-75, y:(scrollView.frame.size.height/2)-125, width : 150, height : 150)
        }
    
        scrollView.contentSize = CGSize(width: contentWidth, height: scrollView.frame.size.height)
    }
    
    @IBAction func gotoThirdScreen(_ sender: Any) {
        let data = "Data to be passed"
        performSegue(withIdentifier: "ThirdViewController", sender: data)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? ThirdViewController{
            
            if let data = sender as? String{
                destination.getDataComing = data
            }
        }
    }
    
    @IBAction func goBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
