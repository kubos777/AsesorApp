//
//  CrearPublicacionViewController.swift
//  final
//
//  Created by kubos on 11/27/18.
//  Copyright © 2018 julianYjorge. All rights reserved.
//

import UIKit

class CrearPublicacionViewController: UIViewController {

    @IBOutlet weak var tituloOutlet: UITextField!
    @IBOutlet weak var montoOutlet: UITextField!
   
    @IBOutlet weak var fechaOutlet: UIDatePicker!
    @IBOutlet weak var descripcionOutlet: UITextField!
    let faltanDatos: String = "Faltan datos"
    
    @IBOutlet weak var faltaOutlet: UILabel!
    @IBAction func crearAction(_ sender: UIButton) {
        guard !((tituloOutlet.text?.isEmpty ?? true) ||  (montoOutlet.text?.isEmpty ?? true) ||  (descripcionOutlet.text?.isEmpty ?? true))  else{
            faltaOutlet.text = faltanDatos
            faltaOutlet.isHidden = false
            return}
        
        guard let user: Usuario = Usuario.getUserToken() else {
            return
        }
        
        let publicacion: Publicacion = Publicacion(tema: tituloOutlet.text!, fecha: fechaOutlet.date, precio: Double(montoOutlet.text!)!, usuario: user, descripcion: descripcionOutlet.text!)

        guard let user2: Usuario = Usuario.getUserToken() else {
            return
        }
 
        Publicacion.saveToServer(publicacion: publicacion)
        
        user2.asesoriasPedidas.append(publicacion)
        Usuario.setUserToken(token: user2)
        Usuario.updateServer(user: user2)
        
        performSegue(withIdentifier: "unwindSegue", sender: nil)
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
