//
//  ViewController.swift
//  image_viewer
//
//  Created by user196869 on 7/20/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var image_viewer: UIImageView!
    @IBOutlet weak var loadingActivity: UIActivityIndicatorView!
    @IBOutlet weak var lblName: UILabel!
    var index = 0
    let imageCount = 5
    
    func imageFetch()
    {
        loadingActivity.startAnimating()
        ImageFetch.fetchImg(index: index) { (data) in
            
            DispatchQueue.main.async {[unowned self] in
                self.image_viewer.image =  UIImage(data: data)
                self.loadingActivity.stopAnimating()
            }
        }
    }
    
    func createSwipeID (for direction: UISwipeGestureRecognizer.Direction) -> UISwipeGestureRecognizer{
        let swipeGesID = UISwipeGestureRecognizer(target: self, action: #selector(didSwipe(_:)))
        swipeGesID.direction = direction
        return swipeGesID
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        imageFetch()
        loadingActivity.hidesWhenStopped = true
        image_viewer.isUserInteractionEnabled = true
        image_viewer.addGestureRecognizer(createSwipeID(for: .right))
        image_viewer.addGestureRecognizer(createSwipeID(for: .left))
        image_viewer.addGestureRecognizer(createSwipeID(for: .up))
        image_viewer.addGestureRecognizer(createSwipeID(for: .down))
    }
    
    @objc func didSwipe (_ sender:UISwipeGestureRecognizer){
        switch sender.direction{
        case .right, .down:
                self.btnPrev_pressed(sender)
        case .left, .up:
                self.btnNext_pressed(sender)
        default:
            break
        }
    }


    @IBAction func btnPrev_pressed(_ sender: Any) {
        index = index - 1
        if (index <  0)
        {
            index = 4
        }
        imageFetch()
        }
    
    @IBAction func btnNext_pressed(_ sender: Any) {
        index = index + 1
        if (index >= 5)
        {
            index = 0
        }
        imageFetch()
    }
}

