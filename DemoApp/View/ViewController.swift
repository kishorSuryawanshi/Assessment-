//
//  ViewController.swift
//  DemoApp
//
//  Created by Kishor on 11/01/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var userNameTxf: UITextField!
    @IBOutlet weak var errorLbl: UILabel!
    private var vModel = DemoViewModel.shared
    override func viewDidLoad() {
        super.viewDidLoad()
        self.bindViewModel()
        self.userNameTxf.delegate = self
    }

    @IBAction func onSubmitClicked(_ sender: Any) {
        if let name = userNameTxf.text, !name.isEmpty {
            self.vModel.uploadDataOnServer(userName: name)
        } else {
            errorLbl.isHidden = false
        }
    }
    
    func bindViewModel() {
        self.vModel.handleOnSuccess = {
            DispatchQueue.main.async {
                if self.vModel.getEmployeeData().count == 0 {
                    self.userNameTxf.text = ""
                    let alert = UIAlertController(title: "Alert", message: "API succeed but no Data Available, Please add data", preferredStyle: .alert)
                    let action = UIAlertAction(title: "Okay", style: .default)
                    alert.addAction(action)
                    self.present(alert, animated: true)
                } else {
                    let stb = UIStoryboard(name: "Main", bundle: nil)
                    let vc = stb.instantiateViewController(withIdentifier: "ShowUserVC") as! ShowUserVC
                    self.navigationController?.pushViewController(vc, animated: true)
                }
            }
        }
        
        self.vModel.handleOnFailure = {
            let alert = UIAlertController(title: "Failure", message: "Data addition failed", preferredStyle: .alert)
            let action = UIAlertAction(title: "Okay", style: .default)
            alert.addAction(action)
            DispatchQueue.main.async {
                self.present(alert, animated: true)
            }
        }
    }
}

extension ViewController: UITextFieldDelegate {
   
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        self.errorLbl.isHidden = true
        return true
    }
}


