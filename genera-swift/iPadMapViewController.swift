//
//  iPadMapViewController.swift
//  Created by ParksConnect on 12/14/18
//

import UIKit
import WebKit

class iPadMapViewController: UIViewController, UIWebViewDelegate, UIScrollViewDelegate {
    
    @IBOutlet weak var image2: UIImageView!
    @IBOutlet weak var scrollview2: UIScrollView!
    @IBAction func MapDone(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "done", sender: self)

    }
    
    @IBAction func Home(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "home", sender: self)

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollview2.minimumZoomScale = 1.0
        scrollview2.maximumZoomScale = 10.0
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(onDoubleTap(gestureRecognizer:)))
        tapRecognizer.numberOfTapsRequired = 2
        view.addGestureRecognizer(tapRecognizer)
        
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return image2
        
    }
    
    @objc func onDoubleTap(gestureRecognizer: UITapGestureRecognizer) {
        let scale = min(scrollview2.zoomScale * 3.5, scrollview2.maximumZoomScale)
        if scale != scrollview2.zoomScale {
            let point = gestureRecognizer.location(in: image2)
            let scrollSize = scrollview2.frame.size
            let size = CGSize(width: scrollSize.width / scale,
                              height: scrollSize.height / scale)
            let origin = CGPoint(x: point.x - size.width / 2,
                                 y: point.y - size.height / 2)
            scrollview2.zoom(to:CGRect(origin: origin, size: size), animated: true)
            print(CGRect(origin: origin, size: size))
        }
    }
    
}

