//
//  startSessionViewController.swift
//  final
//
//  Created by Alonso de Gortari Rabiela on 11/25/18.
//  Copyright © 2018 julianYjorge. All rights reserved.
//

import UIKit

class startSessionViewController: UIViewController {

    @IBOutlet weak var usuarioOutlet: UITextField!
    @IBOutlet weak var contrasenaOutlet: UITextField!
    
    
    func searchUser(user: String, contrasena: String) -> Bool{
        guard let usuario = Usuario.loadFromServer() else {
            return false
        }
        
        guard let match = usuario.first(where: {
            $0.nombre == user
        })else {
          return false
        }
        
        guard match.contrasena == contrasena else {
            return false
        }
        
        return true
        
    }
    
    @IBAction func ingresarAction(_ sender: UIButton) {
        guard let usuario = usuarioOutlet.text else {return}
        guard let contrasena = contrasenaOutlet.text else {return}
        if searchUser(user: usuario, contrasena: contrasena){
            performSegue(withIdentifier: "ingresarSegue", sender: nil)
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
