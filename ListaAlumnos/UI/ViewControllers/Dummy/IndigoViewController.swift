//
//  IndigoViewController.swift
//  ListaAlumnos
//
//  Created by Arturo Gamarra on 8/6/20.
//  Copyright © 2020 Academia moviles. All rights reserved.
//

import UIKit

class IndigoViewController: UIViewController {

    // MARK: - Ciclo de vida
    override class func awakeFromNib() {
        super.awakeFromNib()
        print("2. Hola vengo de un storyboard")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func irARojoButtonTapped(_ sender: UIButton) {
        if let raizVC = navigationController?.viewControllers[0] as? RojoViewController{
            raizVC.hacerAlgo()
            navigationController?.popToViewController(raizVC, animated: true)
        }
        
//        navigationController?.popToRootViewController(animated: true)
    }
    

}
