//
//  PublicacionTableViewController.swift
//  final
//
//  Created by kubOS on 11/23/18.
//  Copyright © 2018 julianYjorge. All rights reserved.
//

import UIKit

class PublicacionTableViewController: UITableViewController {
    
    var publicaciones = [Publicacion]()

    static func loadSampleToDos() -> [Publicacion] {
        let publicacion1 = Publicacion(tema: "Mate", fecha: Date(), precio: 2.11, usuario: "joquin", descripcion: "muy buena")
        let publicacion2 = Publicacion(tema: "compu", fecha: Date(), precio: 222.4, usuario: "mjaas", descripcion: "mala")
        let publicacion3 = Publicacion(tema: "sociales", fecha: Date(), precio: 1.21, usuario: "qwdrqwe", descripcion: "bien")
        
        return [publicacion1, publicacion2, publicacion3]
    }
    
    @IBAction func unwindToPublicacionTable(unwindSegue: UIStoryboardSegue) {

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        publicaciones = PublicacionTableViewController.loadSampleToDos()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return publicaciones.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell =
            tableView.dequeueReusableCell(withIdentifier:
                "PublicacionCellIdentifier") as? PublicacionTableViewCell else {
                    fatalError("Could not dequeue a cell")
        }

        let dateformatter = DateFormatter()
        dateformatter.dateFormat = "yyyy-MM-dd"
        
        
        // Configure the cell...
        let publicacion = publicaciones[indexPath.row]
        cell.temaOutlet?.text = publicacion.tema
        cell.fechaOutlet?.text = dateformatter.string(from: publicacion.fecha)
        cell.precioOutlet?.text = String(publicacion.precio)
        cell.usuarioOutlet?.text = publicacion.usuario
        

        return cell
    }
 
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let publicacion = publicaciones[indexPath.row]
        
        performSegue(withIdentifier: "cellDetailSegue", sender: publicacion)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender:
        Any?) {
        let publicacion = sender as! Publicacion
        let cellDetailController = segue.destination as!
        cellDetailViewController
        cellDetailController.tema = publicacion.tema
        cellDetailController.precio = String(publicacion.precio)
        cellDetailController.descripcion = publicacion.descripcion
        
        let dateformatter = DateFormatter()
        dateformatter.dateFormat = "yyyy-MM-dd"
        
        cellDetailController.fecha = dateformatter.string(from: publicacion.fecha)
        cellDetailController.usuario = publicacion.usuario
        
    
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
