//
//  EmployeeTableViewCell.swift
//  DemoApp
//
//  Created by Kishor on 10/01/24.
//

import UIKit

class EmployeeTableViewCell: UITableViewCell {

    @IBOutlet weak var empName: UILabel!
    @IBOutlet weak var empId: UILabel!
    @IBOutlet weak var empImg: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    // This function set employee data to cell of tableview
    func configureCell(employee: Employee) {
        self.empName.text = employee.visaRequesterName
        self.empId.text = employee.employeeId
        self.empImg.loadImg(url: employee.imageUrl ?? "")
    }
}
