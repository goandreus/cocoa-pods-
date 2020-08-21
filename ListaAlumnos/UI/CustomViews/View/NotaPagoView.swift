//
//  NotaPagoView.swift
//  ListaAlumnos
//
//  Created by Arturo Gamarra on 8/11/20.
//  Copyright © 2020 Academia moviles. All rights reserved.
//

import UIKit

class NotaPagoView: UIView {

    @IBOutlet weak var notaLabel: UILabel!
    @IBOutlet weak var pagoLabel: UILabel!
    @IBOutlet weak var pagoView: UIView!
    
    func setup(by alumno:Alumno) {
        notaLabel.text = "\(alumno.nota)"
        pagoLabel.text = alumno.pago ? "SI" : "NO"
        pagoView.backgroundColor = alumno.pago ? .systemGreen : .systemRed
    }

}
