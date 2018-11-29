//
//  PublicacionTableViewController.swift
//  final
//
//  Created by kubOS on 11/23/18.
//  Copyright © 2018 julianYjorge. All rights reserved.
//

import UIKit

class PublicacionTableViewController: UITableViewController {
    
    var publicaciones: [Publicacion] = []
    
    var fechaPropuesta: Date!
    var fechaHabilitada: Bool!
    var temaPropuesto: String!
    var precioPropuesto: String!
    var busqueda: Bool! = false
    
    
    @IBAction func unwindToPublicacionTable(unwindSegue: UIStoryboardSegue) {
    }
    
    func removeUserPublications(publicaciones: [Publicacion], buscar: Bool) -> [Publicacion] {
        
        guard let user = Usuario.getUserToken() else {
            return publicaciones
        }
        
        var publicacionesEdit = publicaciones
        var idx: Int = 0
        
        for _ in publicaciones {
            if publicacionesEdit[idx].usuario.usuario == user.usuario {
                publicacionesEdit.remove(at: idx)
                
            } else if publicacionesEdit[idx].asesor != nil{
                publicacionesEdit.remove(at: idx)
            } else if buscar{
                if !temaPropuesto.isEmpty && !publicacionesEdit[idx].tema.hasPrefix(temaPropuesto){
                    publicacionesEdit.remove(at: idx)
                }
                else if !precioPropuesto.isEmpty && publicacionesEdit[idx].precio < Double(precioPropuesto)!{
                    publicacionesEdit.remove(at: idx)
                }
                else if fechaHabilitada && publicacionesEdit[idx].fecha < fechaPropuesta {
                    publicacionesEdit.remove(at: idx)
                }
                else {
                    idx += 1
                }
                
            }else {
                idx += 1
            }
            
        }
        return publicacionesEdit
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        guard let publicacionesServer = Publicacion.loadFromServer() else {
            publicaciones = [Publicacion]()
            return
        }
        publicaciones = removeUserPublications(publicaciones: publicacionesServer, buscar: busqueda)
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
        cell.usuarioOutlet?.text = publicacion.usuario.nombre
        

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
        cellDetailController.publicacion = publicacion
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
