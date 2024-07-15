//
//  TeacherDetailsViewController.swift
//  day1-exercise
//
//  Created by FDC-GLORYMAE on 7/16/24.
//

import UIKit

class TeacherDetailsViewController: UIViewController {
    
    var teacherName: String?
    var teacherCountry: String?
    var teacherImage: UIImage?
    var teacherAddress: String?
    var teacherRating: UIImage?
    
    
    @IBOutlet weak var teacherNameLabel: UILabel!
    @IBOutlet weak var countryNameLabel: UILabel!
    @IBOutlet weak var teacherImageView: UIImageView!
    @IBOutlet weak var teacherAddressLabel: UILabel!
    @IBOutlet weak var teacherRatingView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        teacherNameLabel.text = teacherName
        countryNameLabel.text = teacherCountry
        teacherImageView.image = teacherImage
        teacherAddressLabel.text = teacherAddress
        teacherRatingView.image = teacherRating
    }



}
