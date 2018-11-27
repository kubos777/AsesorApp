//
//  startSessionViewController.swift
//  final
//
//  Created by Alonso de Gortari Rabiela on 11/25/18.
//  Copyright © 2018 julianYjorge. All rights reserved.
//

import UIKit

class startSessionViewController: UIViewController {

    @IBOutlet weak var errorOutlet: UILabel!
    @IBOutlet weak var usuarioOutlet: UITextField!
    @IBOutlet weak var contrasenaOutlet: UITextField!
    
    let errorString: String = "Usuario o contraseña erróneo"
    
    @IBAction func unwindToStartSessionView(unwindSegue: UIStoryboardSegue) {
        
    }
    
    @IBAction func ingresarAction(_ sender: UIButton) {
        guard let usuario = usuarioOutlet.text else {return}
        guard let contrasena = contrasenaOutlet.text else {return}
        if let savedUser = Usuario.searchUserAndPassword(user: usuario, contrasena: contrasena){
            Usuario.setUserToken(token: savedUser)
            performSegue(withIdentifier: "ingresarSegue", sender: savedUser)
        }
        else{
            errorOutlet.text = errorString
            errorOutlet.isHidden = false
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender:
        Any?) {
        if segue.identifier == "ingresarSegue"{
            let usuario = sender as! Usuario
            let nav = segue.destination as! UINavigationController
            let menuController = nav.topViewController as! MenuViewController
            
            menuController.greeting = "¡Hola " + usuario.nombre
        }
        
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
