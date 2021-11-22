//
//  ViewController.swift
//  ProvaIos27
//
//  Created by COTEMIG on 13/03/38 ERA1.
//

import UIKit
import FirebaseAuth

class ViewController: UIViewController {

    /*
        AUTOR DO PROJETO0
        MATRICULA: 21900680
        NUMERO DE CHAMADA: 27
        NOME: JOAO VITOR DE OLIVEIRA MENDES
     */
    
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtSenha: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func btnLogin(_ sender: Any) {
        let email: String? = txtEmail.text;
        let senha: String? = txtSenha.text;
        
        if email! == "" || senha! == "" {
            let alert = UIAlertController(title: "Alerta", message: "Preencha todos os campos", preferredStyle: UIAlertController.Style.alert);
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil));
            self.present(alert, animated: true, completion: nil);
        }else {
            Auth.auth().signIn(withEmail: email!, password: senha!, completion: {
                authResult, error in
                
                if error != nil {
                    print(error);
                }else {
                    self.performSegue(withIdentifier: "loginToHome", sender: nil);
                }
            })
        }
    }
    
}

