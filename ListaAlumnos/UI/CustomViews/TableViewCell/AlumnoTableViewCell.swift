//
//  AlumnoTableViewCell.swift
//  ListaAlumnos
//
//  Created by Arturo Gamarra on 8/4/20.
//  Copyright © 2020 Academia moviles. All rights reserved.
//

import UIKit

class AlumnoTableViewCell: UITableViewCell {
    
    // MARK: - Constantes
    static let identificador = "AlumnoCell"

    // MARK: - Propiedades
    @IBOutlet weak var alumnoImageView: UIImageView!
    @IBOutlet weak var nombreLabel: UILabel!
    @IBOutlet weak var notaPagoView: NotaPagoView!
    
    
}
