//
//  RegisterViewController.swift
//  ProvaIos27
//
//  Created by COTEMIG on 13/03/38 ERA1.
//

import UIKit
import FirebaseAuth

class RegisterViewController: UIViewController {

    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtSenha: UITextField!
    @IBOutlet weak var txtSenhaConfirm: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad();

        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnRegister(_ sender: Any) {
        let email: String? = txtEmail.text;
        let senha: String? = txtSenha.text;
        let senhaConfirm: String? = txtSenhaConfirm.text;
        
        if email! == "" || senha! == "" || senhaConfirm! == "" {
            let alert = UIAlertController(title: "Alerta", message: "Preencha todos os campos", preferredStyle: UIAlertController.Style.alert);
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil));
            self.present(alert, animated: true, completion: nil);
        }else if senha != senhaConfirm {
            let alert = UIAlertController(title: "Alerta", message: "As senhas precisam ser identicas", preferredStyle: UIAlertController.Style.alert);
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil));
            self.present(alert, animated: true, completion: nil);
        }else {
            Auth.auth().createUser(withEmail: email!, password: senha!, completion: {
                authResult, error in
                if error != nil {
                    let alert = UIAlertController(title: "Alerta", message: error!.localizedDescription, preferredStyle: UIAlertController.Style.alert);
                    alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil));
                    self.present(alert, animated: true, completion: nil);
                }else {
                    Auth.auth().signIn(withEmail: email!, password: senha!, completion: {
                        authResult, error in
                        
                        if error != nil {
                            let alert = UIAlertController(title: "Alerta", message: error!.localizedDescription, preferredStyle: UIAlertController.Style.alert);
                            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil));
                            self.present(alert, animated: true, completion: nil);
                        }else {
                            self.performSegue(withIdentifier: "registerToHome", sender: nil);
                        }
                    })
                }
            })
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
