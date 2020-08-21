//
//  RedViewController.swift
//  ListaAlumnos
//
//  Created by Arturo Gamarra on 8/11/20.
//  Copyright © 2020 Academia moviles. All rights reserved.
//

import UIKit

class RedViewController: UIViewController {
    
    var alumno: Alumno?

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
//        let alertVc = UIAlertController(title: "", message: "Hola \(alumno?.nombre ?? "")", preferredStyle: .alert)
//        let okButton = UIAlertAction(title: "ok", style: .default, handler: nil)
//        alertVc.addAction(okButton)
//        present(alertVc, animated: true, completion: nil)
    }


}
