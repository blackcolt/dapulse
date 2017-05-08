import UIKit

class ViewController: UIViewController {

    let companyService = CompanyService.main

    override func viewDidLoad() {
        super.viewDidLoad()

        companyService.getCompanyName({ (name) in
            print(name)
        })

        companyService.getTopLevelEmployees(completion: { (employees) in
            print(employees)
        })

        companyService.getEmployees(forManagerId: 22, completion: { (employees) in
            print(employees)
        })
    }

    override func loadView() {
        super.loadView()

        view.backgroundColor = .white
    }
}

