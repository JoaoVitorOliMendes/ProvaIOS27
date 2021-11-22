//
//  TableViewViewController.swift
//  ProvaIos27
//
//  Created by COTEMIG on 13/03/38 ERA1.
//

import UIKit
import Firebase
import FirebaseAuth
import CodableFirebase

class TableViewViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var arrayNotas: [notas] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        
        let ref = Database.database().reference()
        let id = Auth.auth().currentUser?.uid
        
        ref.child("Aluno").child(id!).observe(.value, with: {
            snapshot in
            guard let value: [String: [String: String]] = snapshot.value as! [String: [String: String]] else { return }
            print(value.values)
            do {
                let aluno = try FirebaseDecoder().decode([String: notas].self, from: value)
                print(aluno)
                aluno.map({
                    val -> notas in
                    return val.value
                })
                print("///////////////////")
                self.arrayNotas = try FirebaseDecoder().decode([String: notas].self, from: value)
                self.tableView.reloadData()
            } catch let error {
                do {
                    let aluno = try FirebaseDecoder().decode(notas.self, from: value)
                    self.arrayNotas.append(aluno)
                    self.tableView.reloadData()
                }catch let error2 {
                    print(error2)
                    print("-------------------------------------")
                }
                print(error)
            }
        })
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













extension TableViewViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayNotas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celula = tableView.dequeueReusableCell(withIdentifier: "celula", for: indexPath) as! AlunosTableViewCell
        let aluno = arrayNotas[indexPath.row]
        celula.txtNota.text = aluno.nota
        celula.txtAluno.text = aluno.nome
        return celula
    }
    
    
}
