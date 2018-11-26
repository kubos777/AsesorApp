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
    var contrasena: String
    
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
    
    static func saveToServer(publicaciones: [Usuario]) {
        let documentsDirectory =
            FileManager.default.urls(for: .documentDirectory,
                                     in: .userDomainMask).first!
        let archiveURL =
            documentsDirectory.appendingPathComponent(archivo).appendingPathExtension("plist")
        
        let propertyListEncoder = PropertyListEncoder()
        let encodedNotes = try? propertyListEncoder.encode(publicaciones)
        
        try? encodedNotes?.write(to: archiveURL,
                                 options: .noFileProtection)
        
    }
}
