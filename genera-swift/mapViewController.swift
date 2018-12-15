//
//  mapViewController.swift
//  Created by ParksConnect on 12/15/18
//


import UIKit
import WebKit
class mapViewController: UIViewController, UIWebViewDelegate, UIScrollViewDelegate
 {
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var scrollview: UIScrollView!
    @IBOutlet weak var ViewSwitcherControl: UISegmentedControl!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollview.minimumZoomScale = 1.0
        scrollview.maximumZoomScale = 10.0
        
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(onDoubleTap(gestureRecognizer:)))
        tapRecognizer.numberOfTapsRequired = 2
        view.addGestureRecognizer(tapRecognizer)
        
    }
    
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return image
        
    }
    
    @objc func onDoubleTap(gestureRecognizer: UITapGestureRecognizer) {
        let scale = min(scrollview.zoomScale * 3.5, scrollview.maximumZoomScale)
        if scale != scrollview.zoomScale {
            let point = gestureRecognizer.location(in: image)
            let scrollSize = scrollview.frame.size
            let size = CGSize(width: scrollSize.width / scale,
                              height: scrollSize.height / scale)
            let origin = CGPoint(x: point.x - size.width / 2,
                                 y: point.y - size.height / 2)
            scrollview.zoom(to:CGRect(origin: origin, size: size), animated: true)
            print(CGRect(origin: origin, size: size))
        }
    }
    
}
