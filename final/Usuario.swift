//
//  Usuario.swift
//  final
//
//  Created by Alonso de Gortari Rabiela on 11/25/18.
//  Copyright © 2018 julianYjorge. All rights reserved.
//

import Foundation

let archivo = "asesorApp"

struct Usuario: Codable {
    var nombre: String
    var usuario: String
    var contrasena: String
    var apPaterno: String
    var apMaterno: String
    var correo: String
    
    static func loadFromServer() -> [Usuario]?{
        let documentsDirectory =
            FileManager.default.urls(for: .documentDirectory,
                                     in: .userDomainMask).first!
        let archiveURL =
            documentsDirectory.appendingPathComponent(archivo).appendingPathExtension("plist")
        
        let propertyListDecoder = PropertyListDecoder()
        if let retrievedNotesData = try? Data(contentsOf: archiveURL),
            let decodedNotes = try?
                propertyListDecoder.decode(Array<Usuario>.self, from: retrievedNotesData) {
            return decodedNotes
        }
        return nil
    }
    
    static func saveToServer(publicacion: Usuario) {
        let documentsDirectory =
            FileManager.default.urls(for: .documentDirectory,
                                     in: .userDomainMask).first!
        let archiveURL =
            documentsDirectory.appendingPathComponent(archivo).appendingPathExtension("plist")
        
        let propertyListEncoder = PropertyListEncoder()
        let encodedNotes = try? propertyListEncoder.encode(publicacion)
        
        try? encodedNotes?.write(to: archiveURL,
                                 options: .noFileProtection)
        
    }
}
