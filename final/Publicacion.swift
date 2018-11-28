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
    var asesor: Usuario?
    static var currentId: Int = 1
    static let archivo: String = "asesorAppPublicaciones"
    
    init(tema: String, fecha: Date, precio: Double, usuario: Usuario, descripcion: String){
        self.tema = tema
        self.fecha = fecha
        self.precio = precio
        self.usuario = usuario
        self.descripcion = descripcion
        self.id = Publicacion.currentId
        Publicacion.currentId += 1
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
    
    func updateServer() {
        
        guard var publicaciones = Publicacion.loadFromServer() else{
            return
        }
        
        guard let idx = publicaciones.firstIndex (where: {
            $0.id == self.id
        }) else {
            return
        }
        
        publicaciones.remove(at: idx)
        
        let documentsDirectory =
            FileManager.default.urls(for: .documentDirectory,
                                     in: .userDomainMask).first!
        let archiveURL =
            documentsDirectory.appendingPathComponent(Publicacion.archivo).appendingPathExtension("plist")
        
        let propertyListEncoder = PropertyListEncoder()
        let encodedNotes = try? propertyListEncoder.encode(publicaciones)
        
        try? encodedNotes?.write(to: archiveURL,
                                 options: .noFileProtection)
    }
}
