//
//  ViewController.swift
//  CustomPopup
//
//  Created by Apple on 31/08/19.
//  Copyright © 2019 Revolut. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextViewDelegate {
    
    @IBOutlet var textView : UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func alertAction(_ sender: Any) {
        
        let alert = UIAlertController(title: "Hello Alert!", message: "Write Your Text and Informations\n\n\n\n\n", preferredStyle: .alert)
        alert.view.autoresizesSubviews = true
        
        textView = UITextView(frame: CGRect.zero)
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.backgroundColor = UIColor.clear
        textView.delegate = self
        textView.text = "Placeholder text goes right here..."
        textView.textColor = UIColor.lightGray
        
        let leadConstraint = NSLayoutConstraint(item: alert.view, attribute: .leading, relatedBy: .equal, toItem: textView, attribute: .leading, multiplier: 1.0, constant: -8.0)
        let trailConstraint = NSLayoutConstraint(item: alert.view, attribute: .trailing, relatedBy: .equal, toItem: textView, attribute: .trailing, multiplier: 1.0, constant: 8.0)
        
        let topConstraint = NSLayoutConstraint(item: alert.view, attribute: .top, relatedBy: .equal, toItem: textView, attribute: .top, multiplier: 1.0, constant: -64.0)
        let bottomConstraint = NSLayoutConstraint(item: alert.view, attribute: .bottom, relatedBy: .equal, toItem: textView, attribute: .bottom, multiplier: 1.0, constant: 64.0)
        alert.view.addSubview(textView)
        NSLayoutConstraint.activate([leadConstraint, trailConstraint, topConstraint, bottomConstraint])
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .default, handler: { action in

        }))
        
        alert.addAction(UIAlertAction(title: "Done", style: .default, handler: { action in
            print("\(String(describing: self.textView.text))")
        }))
        present(alert, animated: true)
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == UIColor.lightGray {
            textView.text = ""
            textView.textColor = UIColor.black
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        
        if textView.text == "" {
            textView.text = "Placeholder text ..."
            textView.textColor = UIColor.lightGray
        }
    }
    
    @IBAction func popupAction(_ sender: Any) {
        let popupVC = self.storyboard?.instantiateViewController(withIdentifier: "popupviewcontroller") as! PopupViewController
        popupVC.modalPresentationStyle = .overCurrentContext
        popupVC.modalTransitionStyle = .crossDissolve
        present(popupVC, animated: true, completion: nil)
    }
}

