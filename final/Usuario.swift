//
//  Usuario.swift
//  final
//
//  Created by Alonso de Gortari Rabiela on 11/25/18.
//  Copyright © 2018 julianYjorge. All rights reserved.
//

import Foundation


class Usuario: Codable {
    var nombre: String
    var usuario: String
    var contrasena: String
    var apPaterno: String
    var apMaterno: String
    var correo: String
    var asesoriasDadas: [Publicacion]
    var asesoriasPedidas: [Publicacion]
    static let archivo: String = "asesorAppUser"
    static let state: String = "userState"
    
    init(nombre: String, usuario: String, contrasena: String, apPaterno: String, apMaterno: String, correo: String, asesoriasDadas: [Publicacion], asesoriasPedidas: [Publicacion]){
        self.nombre = nombre
        self.contrasena = contrasena
        self.apPaterno = apPaterno
        self.apMaterno = apMaterno
        self.correo = correo
        self.usuario = usuario
        self.contrasena = contrasena
        self.asesoriasDadas = asesoriasDadas
        self.asesoriasPedidas = asesoriasPedidas
    }
    
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
    
    static func saveToServer(usuario: Usuario) {

        var usuarios: [Usuario]
        let documentsDirectory =
            FileManager.default.urls(for: .documentDirectory,
                                     in: .userDomainMask).first!
        let archiveURL =
            documentsDirectory.appendingPathComponent(archivo).appendingPathExtension("plist")
        
        if let usersFile = loadFromServer()
        {
            usuarios = usersFile
            usuarios.append(usuario)
        }
        else {
            usuarios = [usuario]
        }
        
        let propertyListEncoder = PropertyListEncoder()
        let encodedNotes = try? propertyListEncoder.encode(usuarios)
        
        try? encodedNotes?.write(to: archiveURL,
                                 options: .noFileProtection)
     
        
    }
    
    static func searchUser(user: String) -> Bool{
        guard let usuario = loadFromServer() else {
            return false
        }
        
        guard let _ = usuario.first(where: {
            $0.usuario == user
        })else {
            return false
        }
        
        
        return true
        
    }
    
    static func searchUserAndPassword (user: String, contrasena: String) -> Usuario? {
        guard let usuario = loadFromServer() else {
            return nil
        }
        
        guard let match = usuario.first(where: {
            $0.usuario == user
        })else {
            return nil
        }
        
        guard match.contrasena == contrasena else {
            return nil
        }
        
        return match
    }
    
    static func updateServer(user: Usuario)
    {
        guard var usuarioServer = loadFromServer() else {
            return
        }
        
        guard let idx = usuarioServer.firstIndex (where: {
            $0.usuario == user.usuario
        }) else {
            return
        }
        
        usuarioServer[idx] = user
        
        let documentsDirectory =
            FileManager.default.urls(for: .documentDirectory,
                                     in: .userDomainMask).first!
        let archiveURL =
            documentsDirectory.appendingPathComponent(archivo).appendingPathExtension("plist")
        
        
        let propertyListEncoder = PropertyListEncoder()
        let encodedNotes = try? propertyListEncoder.encode(usuarioServer)
        
        try? encodedNotes?.write(to: archiveURL,
                                 options: .noFileProtection)
        
        
    }
    
    static func setUserToken(token: Usuario)
    {
        let documentsDirectory =
            FileManager.default.urls(for: .documentDirectory,
                                     in: .userDomainMask).first!
        let archiveURL =
            documentsDirectory.appendingPathComponent(state).appendingPathExtension("plist")
        
        

        let propertyListEncoder = PropertyListEncoder()
        let encodedNotes = try? propertyListEncoder.encode(token)
        
        try? encodedNotes?.write(to: archiveURL,
                                 options: .noFileProtection)
    }
    
    static func getUserToken() -> Usuario? {
        let documentsDirectory =
            FileManager.default.urls(for: .documentDirectory,
                                     in: .userDomainMask).first!
        
        let archiveURL =
            documentsDirectory.appendingPathComponent(state).appendingPathExtension("plist")
        
        
        let propertyListDecoder = PropertyListDecoder()
        if let retrievedNotesData = try? Data(contentsOf: archiveURL),
            let decodedNotes = try?
                propertyListDecoder.decode(Usuario.self, from: retrievedNotesData) {
            
            return decodedNotes
        }
        return nil
    }
}
