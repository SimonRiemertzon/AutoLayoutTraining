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
    
    let descriptionTextView: UITextView = {
        let textView = UITextView()
        let attributedText = NSMutableAttributedString(string: "Join us today in our fun and games", attributes: [NSAttributedStringKey.font : UIFont.boldSystemFont(ofSize: 18)])
        
        attributedText.append(NSAttributedString(string: "\n\n\n Are you ready for loads and loads of fun? Dont wait any longer! We hope to see you in our stores soon.", attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 13), NSAttributedStringKey.foregroundColor: UIColor.gray]))
        
        textView.attributedText = attributedText
        textView.textAlignment = .center
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.isEditable = false
        textView.isScrollEnabled = false
        return textView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        view.addSubview(descriptionTextView)
        
        setupLayout()
        
    }
    
    private func setupLayout() {
        let topImageContainerView = UIView()
        view.addSubview(topImageContainerView)
        
        topImageContainerView.useAutolayoutWith(topAnchor: view.safeAreaLayoutGuide.topAnchor,
                                                leadingAnchor: view.leadingAnchor,
                                                bottomAnchor: view.safeAreaLayoutGuide.bottomAnchor,
                                                trailingAnchor: view.trailingAnchor, padding: .init(top: 0, left: 16, bottom: 0, right: 16))
        
        
        topImageContainerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5).isActive = true
        
        topImageContainerView.addSubview(starImageView)
        
        starImageView.centerXAnchor.constraint(equalTo: topImageContainerView.centerXAnchor).isActive = true
        starImageView.centerYAnchor.constraint(equalTo: topImageContainerView.centerYAnchor).isActive = true
        
        starImageView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        starImageView.heightAnchor.constraint(equalTo: topImageContainerView.heightAnchor, multiplier: 0.5).isActive = true
        starImageView.alpha = 1
        
        descriptionTextView.topAnchor.constraint(equalTo: topImageContainerView.bottomAnchor).isActive = true
        descriptionTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24).isActive = true
        descriptionTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24).isActive = true
        descriptionTextView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

extension UIView {
    func useAutolayoutWith(topAnchor: NSLayoutYAxisAnchor, leadingAnchor: NSLayoutXAxisAnchor, bottomAnchor: NSLayoutYAxisAnchor, trailingAnchor: NSLayoutXAxisAnchor, padding: UIEdgeInsets = .zero) {
        translatesAutoresizingMaskIntoConstraints = false
        
        self.topAnchor.constraint(equalTo: topAnchor, constant: padding.top).isActive = true
        self.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding.left).isActive = true
        self.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding.right).isActive = true
        self.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -padding.bottom).isActive = true
    }
}

