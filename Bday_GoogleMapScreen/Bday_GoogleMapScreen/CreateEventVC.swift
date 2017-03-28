//
//  CreateEventView.swift
//  Bday
//
//  Created by Appinventiv on 25/03/17.
//  Copyright © 2017 Appinventiv. All rights reserved.
//

import UIKit

class CreateEventVC: UIViewController {
    
    
    @IBOutlet weak var infoTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initialSetup()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    @IBAction func CancelButtonTapped(_ sender: UIButton) {
    }
    
    @IBAction func CreateButtonTapped(_ sender: UIButton) {
    }
    
    
    func addPicButtonTapped(_ sender: UIButton) {
        
        
        let actionSheet = UIAlertController(title: nil, message: nil, preferredStyle: UIAlertControllerStyle.actionSheet)
        
        actionSheet.addAction(UIAlertAction(title: "Camera", style: UIAlertActionStyle.default, handler: { (alert:UIAlertAction!) -> Void in
            
            self.camera()
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Gallery", style: UIAlertActionStyle.default, handler: { (alert:UIAlertAction!) -> Void in
            self.photoLibrary()
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel, handler: nil))
        
        self.present(actionSheet, animated: true, completion: nil)
        
    }
    
    func openMap(){
        
        let mapVC = self.storyboard?.instantiateViewController(withIdentifier: "GoogleMapVCID") as! GoogleMapVC
        
        mapVC.delegate = self
        
        self.navigationController?.pushViewController(mapVC, animated: true)
    }
    
    func camera()
    {
        
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            
            let myPickerController = UIImagePickerController()
            myPickerController.delegate = self
            myPickerController.sourceType = UIImagePickerControllerSourceType.camera
            
            self.present(myPickerController, animated: true, completion: nil)
            
        }else{
            
            print("Camera not found")
        }
        
    }
    
    func photoLibrary()
    {
        
        let myPickerController = UIImagePickerController()
        myPickerController.delegate = self
        myPickerController.sourceType = UIImagePickerControllerSourceType.photoLibrary
        
        self.present(myPickerController, animated: true, completion: nil)
        
    }
    
    private func initialSetup(){
        
        self.infoTableView.dataSource = self
        self.infoTableView.delegate = self
        
        let nib1 = UINib(nibName: "LabelandTextFieldCell", bundle: nil)
        self.infoTableView.register(nib1, forCellReuseIdentifier: "LabelandTextFieldCellID")
        
        let nib2 = UINib(nibName: "LabelWithSwitchCell", bundle: nil)
        self.infoTableView.register(nib2, forCellReuseIdentifier: "LabelWithSwitchCellID")
        
        let nib3 = UINib(nibName: "DescriptionCell", bundle: nil)
        self.infoTableView.register(nib3, forCellReuseIdentifier: "DescriptionCellID")
        
        let nib4 = UINib(nibName: "InviteFriendsCell", bundle: nil)
        self.infoTableView.register(nib4, forCellReuseIdentifier: "InviteFriendsCellID")
        
        
        
    }
    
    func calendarBtnTapped(_ sender: UIButton) {
        
        let cell = sender.tableViewCell as! LabelandTextFieldCell
        
        cell.infoTextField.becomeFirstResponder()
        
    }
}

extension CreateEventVC : AddLocationDelegate {

    func getLocation(address: String, latitude: Double, longitude: Double) {
        
        let cell = infoTableView.cellForRow(at: [2,1]) as! LabelandTextFieldCell
        
        cell.infoTextField.text = "\(address)"
    }
}


extension CreateEventVC : UIImagePickerControllerDelegate ,UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]){
        
        guard let cell = infoTableView.cellForRow(at: [0,0]) as? HeaderCell else{fatalError("Cell not found")}
        
        cell.titleImageView.image = info[UIImagePickerControllerOriginalImage] as? UIImage
        self.dismiss(animated: true, completion: nil)
    }
    
}

extension CreateEventVC : UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        
        switch section {
            
        case 0: return 1
            
        case 1: return 2
            
        case 2: return 3
            
        case 3: return 2
            
        default: return 0
            
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        
        if indexPath.section == 0 {
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "HeaderCellID", for: indexPath) as? HeaderCell else { fatalError() }
            
            cell.addPicButton.addTarget(self, action: #selector(addPicButtonTapped), for: .touchUpInside)
            
            return cell
        }else if indexPath.section == 1 {
            
            if indexPath.row == 0 {
                
                guard let cell = tableView.dequeueReusableCell(withIdentifier: "LabelandTextFieldCellID", for: indexPath) as? LabelandTextFieldCell else { fatalError() }
                cell.infoLabel.text = "Event Title"
                cell.nextArrowButton.isHidden = true
                
                return cell
                
            }else {
                
                guard let cell = tableView.dequeueReusableCell(withIdentifier: "DescriptionCellID", for: indexPath) as? DescriptionCell else { fatalError() }
                
                
                return cell
            }
            
        }else if indexPath.section == 2 {
            
            if indexPath.row == 0 {
                
                guard let cell = tableView.dequeueReusableCell(withIdentifier: "LabelandTextFieldCellID", for: indexPath) as? LabelandTextFieldCell else { fatalError() }
                cell.infoLabel.text = "When"
                
                cell.setDatePicker()
                cell.nextArrowButton.addTarget(self, action: #selector(self.calendarBtnTapped), for: .touchUpInside)
                
                return cell
                
            }else if indexPath.row == 1 {
                
                guard let cell = tableView.dequeueReusableCell(withIdentifier: "LabelandTextFieldCellID", for: indexPath) as? LabelandTextFieldCell else { fatalError() }
                cell.infoLabel.text = "Location"
                cell.nextArrowButton.addTarget(self, action: #selector(openMap), for: .touchUpInside)
                
                return cell
                
            }else {
                
                guard let cell = tableView.dequeueReusableCell(withIdentifier: "LabelWithSwitchCellID", for: indexPath) as? LabelWithSwitchCell else { fatalError() }
                
                cell.titleLabel.text = "Make it Public"
                
                return cell
                
            }
            
        }else {
            
            if indexPath.row == 0 {
                
                guard let cell = tableView.dequeueReusableCell(withIdentifier: "InviteFriendsCellID", for: indexPath) as? InviteFriendsCell else { fatalError() }
                cell.titleLabel.text = "Invite Friends"
                return cell
                
            }else {
                
                guard let cell = tableView.dequeueReusableCell(withIdentifier: "LabelWithSwitchCellID", for: indexPath) as? LabelWithSwitchCell else { fatalError() }
                
                cell.titleLabel.text = "Guests can sugests guests"
                
                return cell
                
            }
            
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int{
        
        return 4
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        
        if section == 0 {
            
            return 0
            
        }else {
            
            return 15
            
        }
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.8971144557, green: 0.897796452, blue: 0.8972200751, alpha: 1)
        return view
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.section == 0 && indexPath.row == 0{
            
            return 160
            
        }else if indexPath.section == 1 && indexPath.row == 1 {
            
            
            return 104
            
        }else {
            
            return 44
            
        }
    }
    
}

class HeaderCell : UITableViewCell {
    
    @IBOutlet weak var titleImageView: UIImageView!
    @IBOutlet weak var addPicButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.addPicButton.layer.cornerRadius = self.addPicButton.frame.width/2
    }
    
}
