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
        self.tableView.dataSource = self
        
        let ref = Database.database().reference()
        let id = Auth.auth().currentUser?.uid
        
        ref.child("Aluno").child(id!).observe(.value, with: {
            snapshot in
            guard let value: [String: [String: String]] = snapshot.value as? [String: [String: String]] else { return }
            do {
                let array = Array(value.values)
                self.arrayNotas = try FirebaseDecoder().decode([notas].self, from: array)
                self.tableView.reloadData()
            } catch let error {
                do {
                    let array = Array(value.values)
                    let aluno = try FirebaseDecoder().decode(notas.self, from: array)
                    self.arrayNotas.append(aluno)
                    self.tableView.reloadData()
                }catch let error2 {
                    if error2 != nil {
                        let alert = UIAlertController(title: "Alerta", message: error2.localizedDescription, preferredStyle: UIAlertController.Style.alert);
                        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil));
                        self.present(alert, animated: true, completion: nil);
                    }
                }
                if error != nil {
                    let alert = UIAlertController(title: "Alerta", message: error.localizedDescription, preferredStyle: UIAlertController.Style.alert);
                    alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil));
                    self.present(alert, animated: true, completion: nil);
                }
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
        let aluno = arrayNotas[indexPath.row]
        let celula = tableView.dequeueReusableCell(withIdentifier: "celula", for: indexPath) as! CelulaTableViewCell
        celula.lblAluno.text = aluno.nome
        celula.lblNota.text = aluno.nota
        return celula
    }
    
    
}
