//
//  AlumnoDetalleViewController.swift
//  ListaAlumnos
//
//  Created by Arturo Gamarra on 8/6/20.
//  Copyright © 2020 Academia moviles. All rights reserved.
//

import UIKit

class AlumnoDetalleViewController: UIViewController {
    
    // MARK: - Propiedades
    @IBOutlet weak var alumnoImageView: UIImageView!
    @IBOutlet weak var nombreLabel: UILabel!
    @IBOutlet weak var notaPagoView: NotaPagoView!
    var alumno: Alumno?
    
    // MARK: - Ciclo de vida
    override func viewDidLoad() {
        super.viewDidLoad()
        if let miAlumno = alumno {
            nombreLabel.text = miAlumno.nombre
            notaPagoView.setup(by: miAlumno)
        }
        //nombreLabel.text = alumno?.nombre
    }
    
    // MARK: - Actions
    @IBAction func shareButtonTapped(_ sender: UIBarButtonItem) {
        
        
    }
    
    
}
