//
//  SignInViewController.swift
//  day1-exercise
//
//  Created by FDC-GLORYMAE on 7/16/24.
//

import UIKit

class SignInViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func loginButton(_ sender: Any) {
        
        let vc = TeacherListViewController()
//        vc.modalPresentationStyle = .fullScreen
        
        //modal presentation; partner dismiss
//        self.present(vc, animated: true)
        
        // create a navigation controller
        self.navigationController?.pushViewController(vc, animated: true)
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
