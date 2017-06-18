import UIKit
import Hero

class ViewController: UIViewController {

    @IBOutlet var emploeeyImg: UIImageView!    
    @IBOutlet var emploeesCollectionView: UICollectionView!
    @IBOutlet var companyNameLbl: UILabel!
    let companyService = CompanyService.main
    var employees:[Employee]!
    var currentEmplooey:Employee?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        emploeeyImg.layer.cornerRadius = emploeeyImg.frame.size.width / 2;
        emploeeyImg.clipsToBounds = true;
        emploeeyImg.heroID = "emImage"
        
        employees = [];
        setCompanyName()
        getEmploees()
    }

    override func loadView() {
        super.loadView()
       
        view.backgroundColor = .white
    }
}

extension ViewController {

    func setCompanyName(){
        companyService.getCompanyName({ (name) in
            self.companyNameLbl.text = name
        })
    }
    
    func getEmploees(){
        companyService.getEmployees(forManagerId: currentEmplooey?.id) { (employees) in
            self.employees = employees
            if let curEmp = self.currentEmplooey{
                self.companyNameLbl.text = curEmp.name
                self.emploeeyImg.af_setImage(withURL: NSURL(string: curEmp.profilePic)! as URL)
            }
            self.emploeesCollectionView.reloadData()
        }
    }
}

extension ViewController :UICollectionViewDelegate, UICollectionViewDataSource {

    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return employees.count;
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "emploeeCell",
                    for: indexPath) as! emploeesCollectionViewCell
        cell.initWith(employees[indexPath.row])
        return cell;
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let currentEmployee = employees[indexPath.row]
        (emploeesCollectionView.cellForItem(at: indexPath) as! emploeesCollectionViewCell).emploeeImg.heroID = "emImage"
        
        if(currentEmployee.isManager){
            if let vc = storyboard!.instantiateViewController(withIdentifier: "ViewController") as? ViewController {
                vc.currentEmplooey = currentEmployee
                navigationController?.pushViewController(vc, animated: true)
                
            }
            return
        }
        
        if let resultController = storyboard!.instantiateViewController(withIdentifier: "detailViewController") as? detailViewController {
            resultController.currentEmploee = currentEmployee
             navigationController?.pushViewController(resultController, animated: true)
        }
    }
}


