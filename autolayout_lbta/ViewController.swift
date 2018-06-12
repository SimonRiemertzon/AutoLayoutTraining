//
//  ViewController.swift
//  autolayout_lbta
//
//  Created by Simon Riemertzon on 2018-06-05.
//  Copyright © 2018 Simon Riemertzon. All rights reserved.
//  Erik

import UIKit

class ViewController: UIViewController {
    var descriptionTextView: UITextView!
    var starImageView: UIImageView!
    var topContainerView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //Instansiate ContainerViews
        topContainerView = UIView()
        
        //Instanciate ImageViews
        starImageView = UIImageView(image: #imageLiteral(resourceName: "star"))
     
        //Instanciate TextViews
        descriptionTextView = UITextView()
        let attributedText = NSMutableAttributedString(
            string: "Join us today in our fun and games",
            attributes: [NSAttributedStringKey.font : UIFont.boldSystemFont(ofSize: 18)]
        )
        attributedText.append(
            NSAttributedString(
                string: "\n\n\n Are you ready for loads and loads of fun? Dont wait any longer! We hope to see you in our stores soon.",
                attributes: [
                    NSAttributedStringKey.font: UIFont.systemFont(ofSize: 13),
                    NSAttributedStringKey.foregroundColor: UIColor.gray
                ]
            )
        )
        descriptionTextView.attributedText = attributedText
        descriptionTextView.isEditable = false
        descriptionTextView.isScrollEnabled = false
        descriptionTextView.textAlignment = .center
        
        [descriptionTextView, topContainerView].forEach { view.addSubview($0) }
        [starImageView].forEach { topContainerView.addSubview($0)}
    }
    
    override func viewWillLayoutSubviews() {
        topContainerView.useAutolayoutWith(
            topAnchor: view.safeAreaLayoutGuide.topAnchor,
            leadingAnchor: view.leadingAnchor,
            bottomAnchor: view.safeAreaLayoutGuide.bottomAnchor,
            trailingAnchor: view.trailingAnchor,
            padding: .init(top: 0, left: 16, bottom: 0, right: 16)
        )
        topContainerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5).isActive = true
        
        starImageView.useAutolayoutWith(
            centerXAnchor: topContainerView.centerXAnchor,
            centerYAnchor: topContainerView.centerYAnchor)
        
        starImageView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        starImageView.heightAnchor.constraint(equalTo: topContainerView.heightAnchor, multiplier: 0.5).isActive = true
        starImageView.contentMode = .scaleAspectFit
        
        descriptionTextView.useAutolayoutWith(topAnchor: topContainerView.bottomAnchor, leadingAnchor: view.leadingAnchor, bottomAnchor: view.bottomAnchor, trailingAnchor: view.trailingAnchor, padding: .init(top: 0, left: 24, bottom: 0, right: 24))
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension UIView {
    func useAutolayoutWith(
        topAnchor: NSLayoutYAxisAnchor? = nil,
        leadingAnchor: NSLayoutXAxisAnchor? = nil,
        bottomAnchor: NSLayoutYAxisAnchor? = nil,
        trailingAnchor: NSLayoutXAxisAnchor? = nil,
        centerXAnchor: NSLayoutXAxisAnchor? = nil,
        centerYAnchor: NSLayoutYAxisAnchor? = nil,
        padding: UIEdgeInsets = .zero,
        size: CGSize = .zero
        
        ) {
        self.translatesAutoresizingMaskIntoConstraints = false
        
        if let topAnchor = topAnchor {self.topAnchor.constraint(equalTo: topAnchor, constant: padding.top).isActive = true}
        if let leadingAnchor = leadingAnchor {self.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding.left).isActive = true}
        if let bottomAnchor = bottomAnchor {self.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -padding.bottom).isActive = true}
        if let trailingAnchor = trailingAnchor {self.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding.right).isActive = true}
        if let centerXAnchor = centerXAnchor {self.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true}
        if let centerYAnchor = centerYAnchor {self.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true}
    
        if size.height != 0 {heightAnchor.constraint(equalToConstant: size.height)}
        if size.width != 0 { widthAnchor.constraint(equalToConstant: size.width)}
        
    }
}

