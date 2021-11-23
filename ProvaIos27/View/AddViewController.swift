//
//  AddViewController.swift
//  ProvaIos27
//
//  Created by COTEMIG on 13/03/38 ERA1.
//

import UIKit
import FirebaseAuth
import Firebase

class AddViewController: UIViewController {

    @IBOutlet weak var txtAluno: UITextField!
    @IBOutlet weak var txtNota: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad();

        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnAdd(_ sender: Any) {
        let aluno: String? = txtAluno.text;
        let nota: String? = txtNota.text;
        
        if aluno == "" || nota == "" {
            let alert = UIAlertController(title: "Alerta", message: "Preencha todos os campos", preferredStyle: UIAlertController.Style.alert);
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil));
            self.present(alert, animated: true, completion: nil);
        }else {
            let ref = Database.database().reference()
            let id = Auth.auth().currentUser?.uid
            let id2 = ref.child("Aluno").child(id!).childByAutoId().key ?? ""
            
            let alunoNota = notas(
                nome: aluno!,
                id: id2,
                nota: nota!
            )
            
            var jsonData: Data? = nil
            do {
                jsonData = try alunoNota.jsonData();
            }catch let error {
                print(error);
            }
            
            if jsonData != nil {
                let x = getDictionary(jsonData: jsonData!);
                ref.child("Aluno").child(id!).child(id2).setValue(x);
            }
            txtNota.text = "";
            txtAluno.text = "";
        }
    }
    
    func getDictionary(jsonData: Data) -> [String : Any]? {
        do {
            let json = try JSONSerialization.jsonObject(with: jsonData, options: [])
            guard let dictionary = json as? [String : Any] else {
                return nil
            }
            return dictionary
        } catch let error {
            print(error)
        }
        return nil
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
