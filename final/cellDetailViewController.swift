//
//  cellDetailViewController.swift
//  final
//
//  Created by Alonso de Gortari Rabiela on 11/25/18.
//  Copyright © 2018 julianYjorge. All rights reserved.
//

import UIKit

class cellDetailViewController: UIViewController {
    
    var tema: String!, precio: String!
    var usuario: String!, fecha: String!
    var descripcion: String!
    @IBOutlet weak var temaOutlet: UILabel!
    @IBOutlet weak var precioOutlet: UILabel!
    @IBOutlet weak var usuarioOutlet: UILabel!
    @IBOutlet weak var fechaOutlet: UILabel!
    @IBOutlet weak var descripcionOutlet: UILabel!
    
    @IBAction func aceptarAction(_ sender: UIButton) {
        var user: Usuario = Usuario.getUserToken()!
        
        performSegue(withIdentifier: "unwindSegue", sender: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        temaOutlet.text = tema
        precioOutlet.text = precio
        usuarioOutlet.text = usuario
        fechaOutlet.text = fecha
        descripcionOutlet.text = descripcion
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
