//
//  CitaDetailViewController.swift
//  final
//
//  Created by Alonso de Gortari Rabiela on 11/28/18.
//  Copyright © 2018 julianYjorge. All rights reserved.
//

import UIKit

class CitaDetailViewController: UIViewController {

    var publicacion: Publicacion!
    
    @IBOutlet weak var precioOutlet: UILabel!
    @IBOutlet weak var asesorOutlet: UILabel!
    @IBOutlet weak var fechaOutlet: UILabel!
    @IBOutlet weak var descripcionOutlet: UILabel!
    @IBOutlet weak var temaOutlet: UILabel!
    
    @IBOutlet weak var lugarOutlet: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        temaOutlet.text = publicacion.tema
        precioOutlet.text = String(publicacion.precio)
        
        if publicacion.asesor != nil {
            asesorOutlet.text = publicacion.asesor!.usuario
        } else {
            asesorOutlet.isHidden = true
        }
        
        descripcionOutlet.text = publicacion.descripcion
        
        lugarOutlet.text = publicacion.lugar
        
        let dateformatter = DateFormatter()
        dateformatter.dateFormat = "yyyy-MM-dd"
        fechaOutlet.text = dateformatter.string(from: publicacion.fecha)
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
