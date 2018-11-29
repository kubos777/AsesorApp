//
//  BusquedaViewController.swift
//  final
//
//  Created by Alonso de Gortari Rabiela on 11/28/18.
//  Copyright © 2018 julianYjorge. All rights reserved.
//

import UIKit

class BusquedaViewController: UIViewController {

    @IBOutlet weak var temaOutlet: UITextField!
    @IBOutlet weak var fechaOutlet: UIDatePicker!
    @IBOutlet weak var precioOutlet: UITextField!
   
    @IBOutlet weak var habilitarFechaOutlet: UISwitch!
    
    @IBAction func habilitaFechaAction(_ sender: UISwitch) {
        if sender.isOn {
            sender.setOn(false, animated: true)
            fechaOutlet.isEnabled = false
        } else {
            sender.setOn(true, animated: true)
            fechaOutlet.isEnabled = true
        }
     
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        fechaOutlet.isEnabled = false
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender:
        Any?) {
        
        let publicacionTableView = segue.destination as!
        PublicacionTableViewController
        
        publicacionTableView.busqueda = true
        
        publicacionTableView.fechaHabilitada = habilitarFechaOutlet.isOn
        publicacionTableView.fechaPropuesta = fechaOutlet.date
        
        if let precio = precioOutlet.text{
            publicacionTableView.precioPropuesto = precio
        }
        if let tema = temaOutlet.text {
            publicacionTableView.temaPropuesto = tema
        }
        
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
