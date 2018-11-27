//
//  Propuesta.swift
//  final
//
//  Created by kubOS on 11/23/18.
//  Copyright © 2018 julianYjorge. All rights reserved.
//

import Foundation



class Publicacion: Codable{
    var tema: String
    var fecha: Date
    var precio: Double
    var usuario: Usuario
    var descripcion: String
    var id: Int
    static var currentId: Int = 0
    static let archivo: String = "asesorAppPublicaciones"
    
    init(tema: String, fecha: Date, precio: Double, usuario: Usuario, descripcion: String, id: Int){
        self.tema = tema
        self.fecha = fecha
        self.precio = precio
        self.usuario = usuario
        self.descripcion = descripcion
        self.id = id
    }
    
    static func loadFromServer() -> [Publicacion]?{
        
        
        let documentsDirectory =
            FileManager.default.urls(for: .documentDirectory,
                                     in: .userDomainMask).first!
        
        let archiveURL = documentsDirectory.appendingPathComponent(archivo).appendingPathExtension("plist")
        
        
        let propertyListDecoder = PropertyListDecoder()
        if let retrievedNotesData = try? Data(contentsOf: archiveURL),
            let decodedNotes = try?
                propertyListDecoder.decode(Array<Publicacion>.self, from: retrievedNotesData) {
            
            return decodedNotes
        }
        return nil
    }
    
    static func saveToServer(publicacion: Publicacion) {
        
        var publicaciones: [Publicacion]
        let documentsDirectory =
            FileManager.default.urls(for: .documentDirectory,
                                     in: .userDomainMask).first!
        let archiveURL =
            documentsDirectory.appendingPathComponent(archivo).appendingPathExtension("plist")
        
        if let publicationsFile = loadFromServer()
        {
            publicaciones = publicationsFile
            publicaciones.append(publicacion)
        }
        else {
            publicaciones = [publicacion]
        }
        

        let propertyListEncoder = PropertyListEncoder()
        let encodedNotes = try? propertyListEncoder.encode(publicaciones)
        
        try? encodedNotes?.write(to: archiveURL,
                                 options: .noFileProtection)
        
        
    }
}
