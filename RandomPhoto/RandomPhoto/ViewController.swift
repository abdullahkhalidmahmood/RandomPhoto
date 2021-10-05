  //
//  ViewController.swift
//  RandomPhoto
//
//  Created by Abdullah Khalid on 05/10/2021.
//

import UIKit

class ViewController: UIViewController {

    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .white
        return imageView
    }()
    
    private let button: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.setTitle("Generate Random Photo", for: .normal)
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.backgroundColor = .systemGray6
        view.addSubview(imageView)
        imageView.frame = CGRect(x: 0, y: 0, width: view.frame.size.width-60, height: 300)
        imageView.center = view.center
        
        view.addSubview(button)
        getRandomPhoto()
        
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        
    }
    
    @objc func didTapButton(){
        getRandomPhoto()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        view.addSubview(button)
        button.frame = CGRect(x: 30, y: view.frame.size.height-130, width: view.frame.size.width-60, height: 55)
        button.layer.cornerRadius = 8
    }
    
    func getRandomPhoto(){
        let urlString = "https://source.unsplash.com/random/600x600"
        let url = URL(string: urlString)!
        guard let data = try? Data(contentsOf: url) else {
            return
        }
        imageView.image = UIImage(data: data)
    }


}

