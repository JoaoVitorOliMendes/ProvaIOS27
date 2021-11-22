//
//  PasswordViewController.swift
//  ProvaIos27
//
//  Created by COTEMIG on 13/03/38 ERA1.
//

import UIKit
import FirebaseAuth

class PasswordViewController: UIViewController {

    
    @IBOutlet weak var txtEmail: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad();

        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnSend(_ sender: Any) {
        let email: String? = txtEmail.text;
        
        if email! == "" {
            let alert = UIAlertController(title: "Alerta", message: "Preencha todos os campos", preferredStyle: UIAlertController.Style.alert);
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil));
            self.present(alert, animated: true, completion: nil);
        }else {
            Auth.auth().sendPasswordReset(withEmail: email!, completion: {
                error in
                if error != nil {
                    print(error)
                }else {
                    self.txtEmail.text = "";
                }
            })
        }    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
