//
//  cellDetailViewController.swift
//  final
//
//  Created by Alonso de Gortari Rabiela on 11/25/18.
//  Copyright © 2018 julianYjorge. All rights reserved.
//

import UIKit

class cellDetailViewController: UIViewController {
    
    var publicacion: Publicacion!
    @IBOutlet weak var temaOutlet: UILabel!
    @IBOutlet weak var precioOutlet: UILabel!
    @IBOutlet weak var usuarioOutlet: UILabel!
    @IBOutlet weak var fechaOutlet: UILabel!
    @IBOutlet weak var descripcionOutlet: UILabel!
    
    @IBOutlet weak var lugarOutlet: UILabel!
    @IBAction func aceptarAction(_ sender: UIButton) {
        guard let user: Usuario = Usuario.getUserToken() else {
            return
        }
        publicacion.asesor = user
        
        publicacion.updateServer()
        
        performSegue(withIdentifier: "unwindSegue", sender: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        temaOutlet.text = publicacion.tema
        precioOutlet.text = String(publicacion.precio)
        usuarioOutlet.text = publicacion.usuario.usuario
        descripcionOutlet.text = publicacion.descripcion
        lugarOutlet.text = publicacion.lugar
        let dateformatter = DateFormatter()
        dateformatter.dateFormat = "yyyy-MM-dd"
        fechaOutlet.text = dateformatter.string(from: publicacion.fecha)
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
