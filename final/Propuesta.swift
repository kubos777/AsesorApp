//
//  Propuesta.swift
//  final
//
//  Created by kubOS on 11/23/18.
//  Copyright © 2018 julianYjorge. All rights reserved.
//

import Foundation

class Publicacion{
    var tema: String
    var fecha: Date
    var precio: Double
    var usuario: String
    
    init(tema: String, fecha: Date, precio: Double, usuario: String) {
        self.tema = tema
        self.fecha = fecha
        self.precio = precio
        self.usuario = usuario
    }
}
