//
//  EventsTopVC.swift
//  Bday
//
//  Created by Appinventiv on 24/03/17.
//  Copyright © 2017 Appinventiv. All rights reserved.
//

import UIKit

class EventHeaderView: UIView {

    @IBOutlet weak var dayAndDateLabel: UILabel!
    @IBOutlet weak var partyNameLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var rsvpsButton: UIButton!
    @IBOutlet weak var downArrowButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.initialSetup()
        
    }
    
    class func instanceFromNib() -> UIView {
        return UINib(nibName: "EventHeaderView", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! EventHeaderView
    }
    
    func rsvpsButtonTapped(_ sender: UIButton) {
        
//        let actionSheet = UIAlertController(title: "MY RSVP", message: nil, preferredStyle: UIAlertControllerStyle.actionSheet)
//        
//        actionSheet.addAction(UIAlertAction(title: "Yes! See you there.", style: UIAlertActionStyle.default, handler: { (alert:UIAlertAction!) -> Void in
//            
//        }))
//        
//        
//        
//        actionSheet.addAction(UIAlertAction(title: "Sorry! I can't make it.", style: UIAlertActionStyle.default, handler: { (alert:UIAlertAction!) -> Void in
//        }))
//        
//        actionSheet.addAction(UIAlertAction(title: "Suggest Guests", style: UIAlertActionStyle.default, handler: { (alert:UIAlertAction!) -> Void in
//        }))
//        
//        actionSheet.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel, handler: nil))
//        
//        self.present(actionSheet, animated: true, completion: nil)
    }

    func downArrowButtonTapped(_ sender: UIButton) {
        
        
//        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
//        
//        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (action) in
//        }
//        alertController.addAction(cancelAction)
//        
//        let viewController = InviteFriendsView(nibName: "InviteFriendsView", bundle: nil)
//        let rect = CGRect(x: 0, y: alertController.view.frame.height-250, width: alertController.view.bounds.size.width, height: 157)
//        viewController.view.frame = rect
//        viewController.view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
//        alertController.view.addSubview(viewController.view)
//                
//        self.present(alertController, animated: true)
        
    }

    
    private func initialSetup(){
        
        self.rsvpsButton.layer.borderWidth = 2
        self.rsvpsButton.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1).cgColor
        self.rsvpsButton.layer.cornerRadius = self.rsvpsButton.frame.height/2
        self.rsvpsButton.addTarget(self, action: #selector(rsvpsButtonTapped), for: .touchUpInside)
        self.downArrowButton.addTarget(self, action: #selector(downArrowButtonTapped), for: .touchUpInside)
    }

}
