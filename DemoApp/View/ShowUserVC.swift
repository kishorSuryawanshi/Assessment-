//
//  ShowUserVC.swift
//  DemoApp
//
//  Created by Kishor on 10/01/24.
//

import UIKit

class ShowUserVC: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var vModel = DemoViewModel.shared

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Employees Record"
        self.setupTableView()
    }
    
    private func setupTableView() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(UINib(nibName: "EmployeeTableViewCell", bundle: nil), forCellReuseIdentifier: "kEmployeeTableViewCell")
        self.tableView.reloadData()
    }
}

extension ShowUserVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.vModel.getEmployeeData().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "kEmployeeTableViewCell", for: indexPath) as? EmployeeTableViewCell
        let employee = self.vModel.getEmployeeData()[indexPath.row]
        cell?.configureCell(employee: employee)
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
