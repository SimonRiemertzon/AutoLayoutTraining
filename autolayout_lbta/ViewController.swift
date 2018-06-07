//
//  ViewController.swift
//  autolayout_lbta
//
//  Created by Simon Riemertzon on 2018-06-05.
//  Copyright © 2018 Simon Riemertzon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
      //Structure code so that viewDidLoad doesn't become clutered.
    
    let starImageView: UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "star"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let someOtherImageview: UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "cuteDog"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let descriptionTextView: UITextView = {
       let textView = UITextView()
        textView.text = "Join us today in our fun and games"
        textView.font = UIFont.boldSystemFont(ofSize: 18)
        textView.textAlignment = .center
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.isEditable = false
        textView.isScrollEnabled = false
        return textView
    }()
  
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        view.addSubview(someOtherImageview)

        view.addSubview(descriptionTextView)
        
        setupLayout()
        
    }
    
    private func setupLayout() {
        let topImageContainerView = UIView()
        topImageContainerView.backgroundColor = .blue
        view.addSubview(topImageContainerView)
    
        topImageContainerView.translatesAutoresizingMaskIntoConstraints = false
        topImageContainerView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        topImageContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        topImageContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        topImageContainerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5).isActive = true
        
        topImageContainerView.addSubview(starImageView)
        
        starImageView.centerXAnchor.constraint(equalTo: topImageContainerView.centerXAnchor).isActive = true
        starImageView.centerYAnchor.constraint(equalTo: topImageContainerView.centerYAnchor).isActive = true
        
        starImageView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        starImageView.heightAnchor.constraint(equalTo: topImageContainerView.heightAnchor, multiplier: 0.5).isActive = true
        starImageView.alpha = 0.2
        
        someOtherImageview.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        someOtherImageview.topAnchor.constraint(equalTo: starImageView.topAnchor, constant: 100).isActive = true
        someOtherImageview.widthAnchor.constraint(equalToConstant: 200).isActive = true
        someOtherImageview.heightAnchor.constraint(equalToConstant: 200).isActive = true
        someOtherImageview.alpha = 0.2
        
        descriptionTextView.topAnchor.constraint(equalTo: topImageContainerView.bottomAnchor).isActive = true
        descriptionTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        descriptionTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        descriptionTextView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}

