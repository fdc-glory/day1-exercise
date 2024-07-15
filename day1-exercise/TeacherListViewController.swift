//
//  TeacherListViewController.swift
//  day1-exercise
//
//  Created by FDC-GLORYMAE on 7/16/24.
//

import UIKit

struct Teacher {
    let name: String
    let country: String
    let address: String
    let rating: UIImage
    let image: UIImage
}

class TeacherListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var teachers: [Teacher] = [
            Teacher(name: "Eyan", 
                    country: "United States",
                    address: "1234 Elm Street Apt. 56B Springfield, IL 62704",
                    rating: UIImage(named: "rating.png")!,
                    image: UIImage(named: "contact3.png")!),
            Teacher(name: "Glyn", 
                    country: "United Arab Emirates",
                    address: "Apartment 405, Building 7 Palm Jumeirah Dubai",
                    rating: UIImage(named: "rating.png")!,
                    image: UIImage(named: "contact2.png")!),
            Teacher(name: "Rhiana",
                    country: "United States",
                    address: "5678 Ocean View Drive Apt. 301 Santa Monica, CA 90401",
                    rating: UIImage(named: "rating.png")!,
                    image: UIImage(named: "contact1.png")!)
        ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // put the TeacherCell in identifier TeacherCell storyboard
        let teacherNib = UINib(nibName: "TeacherCell", bundle: nil)
        let bannerNib = UINib(nibName: "BannerCell", bundle: nil)
        
        self.tableView.register(teacherNib, forCellReuseIdentifier: "TeacherCell")
        self.tableView.register(bannerNib, forCellReuseIdentifier: "BannerCell")
    }
    
    enum TableSection: Int, CaseIterable {
            case banner
            case teacher
        }
    

}

extension TeacherListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
            return TableSection.allCases.count
        }
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            guard let section = TableSection(rawValue: section) else { return 0 }
            
            switch section {
            case .banner:
                return 1
            case .teacher:
                return teachers.count
            }
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            guard let section = TableSection(rawValue: indexPath.section) else { return UITableViewCell() }
            
            switch section {
            case .banner:
                let cell = tableView.dequeueReusableCell(withIdentifier: "BannerCell", for: indexPath) as! BannerCell
                return cell
            case .teacher:
                let cell = tableView.dequeueReusableCell(withIdentifier: "TeacherCell", for: indexPath) as! TeacherCell
                cell.accessoryType = .disclosureIndicator
                cell.teacherImageView.image = teachers[indexPath.row].image
                cell.teacherName.text = teachers[indexPath.row].name
                cell.teacherCountry.text = teachers[indexPath.row].country
                return cell
            }
        }

    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard let section = TableSection(rawValue: indexPath.section), section == .teacher else {
        // - ignore taps on the banner section
            return
        }
        // Do something when the cell is tapped
        let selectedTeacher = teachers[indexPath.row]
        let detailsVC = TeacherDetailsViewController()
        
        detailsVC.teacherName = selectedTeacher.name
        detailsVC.teacherCountry = selectedTeacher.country
        detailsVC.teacherImage = selectedTeacher.image
        detailsVC.teacherAddress = selectedTeacher.address
        detailsVC.teacherRating = selectedTeacher.rating
        
        self.navigationController?.pushViewController(detailsVC, animated: true)
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            guard let section = TableSection(rawValue: indexPath.section) else { return UITableView.automaticDimension }
            
            switch section {
            case .banner:
                return 130
            case .teacher:
                return UITableView.automaticDimension
            }
        }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
            let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { (action, view, completionHandler) in
                let alert = UIAlertController(title: "Delete Teacher", message: "Are you sure you want to delete this teacher?", preferredStyle: .alert)
                
                let delete = UIAlertAction(title: "Yes", style: .destructive) { _ in
                    // - remove the teacher from the data source
                    self.teachers.remove(at: indexPath.row)
                    // - delete the row from the table view
                    tableView.deleteRows(at: [indexPath], with: .automatic)
                    completionHandler(true)
                }
                alert.addAction(delete)
                
                let cancel = UIAlertAction(title: "No", style: .cancel) { _ in
                    completionHandler(false)
                }
                alert.addAction(cancel)
                
                self.present(alert, animated: true, completion: nil)
            }
            return UISwipeActionsConfiguration(actions: [deleteAction])
        }
    
}






//    @IBAction func dismissButton(_ sender: Any) {
////        self.dismiss(animated: true)
//        // if use self.present, use dismiss
//
//        self.navigationController?.popViewController(animated: true)
//    }
