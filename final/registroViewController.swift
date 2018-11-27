//
//  registroViewController.swift
//  final
//
//  Created by Alonso de Gortari Rabiela on 11/26/18.
//  Copyright © 2018 julianYjorge. All rights reserved.
//

import UIKit

class registroViewController: UIViewController {

    @IBOutlet weak var nombreOutlet: UITextField!
    @IBOutlet weak var apPaternoOutlet: UITextField!
    @IBOutlet weak var apMaternoOutlet: UITextField!
    @IBOutlet weak var correoOutlet: UITextField!
    @IBOutlet weak var usuarioOutlet: UITextField!
    @IBOutlet weak var contrasenaOutlet: UITextField!
    
    @IBOutlet weak var faltaOutlet: UILabel!
    
    let faltanDatos: String = "Faltan datos"
    let usuarioExiste: String = "Usuario ya existe"
    
    @IBAction func registrarAction(_ sender: UIButton) {
        guard !((nombreOutlet.text?.isEmpty ?? true) ||  (apPaternoOutlet.text?.isEmpty ?? true) || (apMaternoOutlet.text?.isEmpty ?? true) || (correoOutlet.text?.isEmpty ?? true) || (usuarioOutlet.text?.isEmpty ?? true) || (contrasenaOutlet.text?.isEmpty ?? true))  else{
            faltaOutlet.text = faltanDatos
            faltaOutlet.isHidden = false
            return}
        
        guard !Usuario.searchUser(user: usuarioOutlet.text!) else {
            faltaOutlet.text = usuarioExiste
            faltaOutlet.isHidden = false
            return
        }
        
        let newUser: Usuario = Usuario(nombre: nombreOutlet.text!, usuario: usuarioOutlet.text!, contrasena: contrasenaOutlet.text!, apPaterno: apPaternoOutlet.text!, apMaterno: apMaternoOutlet.text!, correo: correoOutlet.text!, asesoriasDadas: [Publicacion](), asesoriasPedidas: [Publicacion]())
        
        Usuario.saveToServer(usuario: newUser)
        
        Usuario.setUserToken(token: newUser)
        
        performSegue(withIdentifier: "registroSegue", sender: newUser)

        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender:
        Any?) {
        let usuario = sender as! Usuario
        let nav = segue.destination as! UINavigationController
        let menuController = nav.topViewController as! MenuViewController
       
        menuController.greeting = "¡Hola " + usuario.nombre
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
