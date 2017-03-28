//
//  LabelandTextFieldCell.swift
//  Bday
//
//  Created by Appinventiv on 25/03/17.
//  Copyright © 2017 Appinventiv. All rights reserved.
//

import UIKit

class LabelandTextFieldCell: UITableViewCell {
    
    var date = String()
    
    @IBOutlet weak var infoTextField: UITextField!
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var nextArrowButton: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    private func doSubViewLoad(){
        
    }
    
    func setDatePicker(){
        
        let pickerView = UIView(frame: CGRect(x: 0, y: UIScreen.main.fixedCoordinateSpace.bounds.height, width: UIScreen.main.fixedCoordinateSpace.bounds.width, height: 280))
        
        let dobPicker = UIDatePicker(frame: CGRect(x: 0, y: 40, width: UIScreen.main.fixedCoordinateSpace.bounds.width, height: 240))
        
        pickerView.backgroundColor = UIColor.white
        
        dobPicker.addTarget(self, action: #selector(datePickerValueChanged(_:)), for: .valueChanged)
        
        dobPicker.datePickerMode = .date
        
        let toolBar = UIToolbar()
        
        toolBar.barStyle = .default
        toolBar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(datePickerDoneBtnTapped(_:)))
        
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil);

        
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(datePickerCancelBtnTapped(_:)))
        
        toolBar.setItems([cancelButton,flexibleSpace,doneButton], animated: false)
        
        toolBar.isUserInteractionEnabled = true
        
        self.infoTextField.inputView = pickerView
        
        pickerView.addSubview(toolBar)
        
        pickerView.addSubview(dobPicker)
    }
    
    func calendarBtnTapped(_ sender: UIButton) {
        
        self.infoTextField.becomeFirstResponder()
        
    }
    
    func datePickerValueChanged(_ picker : UIDatePicker) {
        
        setDateOfBirth(date: (picker.date))
        
    }
    
    func datePickerDoneBtnTapped(_ sender : UIBarButtonItem) {
        
        if self.date != ""{
            
            self.infoTextField.text = self.date
            
        }
        
        self.endEditing(false)
    }
    
    func datePickerCancelBtnTapped(_ sender : UIBarButtonItem) {
        
        self.endEditing(false)
        
    }
    
    func setDateOfBirth(date: Date) {
        
        let dateFormatterPrint = DateFormatter()
        
        dateFormatterPrint.dateFormat = "EEEE, MMM d, yyyy"
        
        self.date = dateFormatterPrint.string(from : date)
        
        
    }
    
}
