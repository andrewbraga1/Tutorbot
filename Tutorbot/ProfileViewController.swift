//
//  ProfileViewController.swift
//  Tutorbot
//
//  Created by student on 31/05/19.
//  Copyright © 2019 student. All rights reserved.
//

import UIKit
import FirebaseAuth

class ProfileViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Perfil"
        // Do any additional setup after loading the view.
    }
    
    @IBAction func cadastrarButton(_ sender: UIButton) {
        let email = emailTextField.text
        let password = passwordTextField.text
        
        Auth.auth().createUser(withEmail: email!, password: password!) { (authResult, error) in
            // ...
            guard let user = authResult?.user else {
                
                 let alert = UIAlertController(title:"Aviso" , message: "Algo inesperado ocorreu.Tente novamente mais tarde.", preferredStyle: .alert)
                
                alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                
                
                return self.present(alert, animated: true)            }
        
        }
        
      self.performSegue(withIdentifier: "LoggedIn", sender: nil)
    
    }
    
    
    @IBAction func loginButton(_ sender: UIButton) {
        let email = emailTextField.text
        let password = passwordTextField.text

        Auth.auth().signIn(withEmail: email!, password: password!) { (user, error) in
            print("logado com sucesso")
            self.title = user?.additionalUserInfo?.username
            self.performSegue(withIdentifier: "LoggedIn", sender: nil)
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
