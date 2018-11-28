//
//  CitasTableViewController.swift
//  final
//
//  Created by Alonso de Gortari Rabiela on 11/27/18.
//  Copyright © 2018 julianYjorge. All rights reserved.
//

import UIKit

class CitasTableViewController: UITableViewController {

    var asesoriasPedidasConCita: [Publicacion] = [Publicacion]()
    var asesoriasPedidasSinCita: [Publicacion] = [Publicacion]()
    var asesoriasDadas: [Publicacion] = [Publicacion]()
    let sectionHeaders: [String] = ["Asesorías a dar", "Asesorías pedidas sin cita", "Asesorías pedidas con cita"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let user = Usuario.getUserToken()!
        asesoriasPedidasConCita = asesoriasConCita(user: user)
        asesoriasPedidasSinCita = asesoriasSinCita(user: user)
        asesoriasDadas = user.asesoriasDadas
        
        print(asesoriasPedidasConCita.count)
        

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }

    func asesoriasConCita(user: Usuario) -> [Publicacion] {
        var conCita = [Publicacion]()
        
        for asesoria in user.asesoriasPedidas {
            if asesoria.asesor != nil {
                conCita.append(asesoria)
            }
        }
        
        return conCita
    }
    
    func asesoriasSinCita(user: Usuario) -> [Publicacion] {
        var sinCita = [Publicacion]()
        
        for asesoria in user.asesoriasPedidas {
            if asesoria.asesor == nil {
                sinCita.append(asesoria)
            }
        }
        
        return sinCita
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return asesoriasDadas.count
        }
        else if section == 1 {
            return asesoriasPedidasSinCita.count
        }
        else {
            return asesoriasPedidasConCita.count
        }
        
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell =
            tableView.dequeueReusableCell(withIdentifier:
                "citasCell") as? PublicacionTableViewCell else {
                    fatalError("Could not dequeue a cell")
        }
        
        
        
        let dateformatter = DateFormatter()
        dateformatter.dateFormat = "yyyy-MM-dd"
        
        var publicacion: Publicacion
        
        // Configure the cell...
        if indexPath.section == 0 {
            publicacion = asesoriasDadas[indexPath.row]
        }
        else if indexPath.section == 1 {
            publicacion = asesoriasPedidasSinCita[indexPath.row]
        }
        else {
            publicacion = asesoriasPedidasConCita[indexPath.row]
        }
        
        cell.temaOutlet?.text = publicacion.tema
        cell.fechaOutlet?.text = dateformatter.string(from: publicacion.fecha)
        cell.precioOutlet?.text = String(publicacion.precio)
    
        
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionHeaders[section]
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
