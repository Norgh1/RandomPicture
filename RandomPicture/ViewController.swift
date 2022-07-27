//
//  ViewController.swift
//  RandomPicture
//
//  Created by Nor Gh on 7/27/22.
//

import UIKit


class ViewController: UIViewController {
    @IBOutlet weak var buttonTapped: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        //heightWidh()
        setButton()
        //setConstraints()
       // imageView.translatesAutoresizingMaskIntoConstraints = false
    }

    
    @IBAction func getImageButtonPressed(_ sender: Any) {
        let API = "https://picsum.photos/360/504"
        guard let apiURL = URL(string: API) else {
            fatalError("Error")
        }
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: apiURL) { ( data, response, error ) in
            guard let data = data, error == nil else { return }
            DispatchQueue.main.async {
                self.imageView.image = UIImage(data: data)
            }
        }
        task.resume()
    }
    

    
    func setButton(){
        buttonTapped.setTitle("Press Button", for: .normal)
        buttonTapped.backgroundColor = .systemBlue
        buttonTapped.layer.cornerRadius = 15
        buttonTapped.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
        //buttonTapped.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setConstraints(){
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 20),
            imageView.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: 40),
            imageView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 10)
        ])
        
        NSLayoutConstraint.activate([
            buttonTapped.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: 1),
            //self.view.safeAreaLayoutGuide.topAnchor.constraint(equalTo: self.imageView.topAnchor, constant: 45)
        ])
        
        
    }
}

