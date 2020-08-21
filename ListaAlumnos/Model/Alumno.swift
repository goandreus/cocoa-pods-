//
//  Alumno.swift
//  ListaAlumnos
//
//  Created by Arturo Gamarra on 8/11/20.
//  Copyright © 2020 Academia moviles. All rights reserved.
//

import UIKit

// PROTOCOL ==> INTERFACE -- contrato de datos
@objc protocol ConvertAString {
    
    func convertir() -> String
    @objc optional func transformar() -> String
}

class Alumno: ConvertAString {
    
    var image: UIImage?
    var nombre: String = ""
    var pago: Bool = true
    var nota: Int = 20
    
    init(nombre:String, pago:Bool, nota:Int) {
        self.nombre = nombre
        self.pago = pago
        self.nota = nota
    }

    func convertir() -> String {
        return nombre
    }
}
