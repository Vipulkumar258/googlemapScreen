//
//  InviteFriendsVC.swift
//  Bday
//
//  Created by Appinventiv on 24/03/17.
//  Copyright © 2017 Appinventiv. All rights reserved.
//

import UIKit

class InviteFriendsView: UIView {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var bdayButton: UIButton!
    @IBOutlet weak var bdayLabel: UILabel!
    @IBOutlet weak var fbButton: UIButton!
    @IBOutlet weak var fbLabel: UILabel!
    @IBOutlet weak var twitterButton: UIButton!
    @IBOutlet weak var twitterLabel: UILabel!
    @IBOutlet weak var emailButton: UIButton!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var smsButton: UIButton!
    @IBOutlet weak var smsLabel: UILabel!
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var cancelButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.initialSetup()
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.topView.layer.cornerRadius = 10
        self.topView.layer.masksToBounds = false
        
        self.cancelButton.layer.cornerRadius = 10
        self.bdayButton.layer.cornerRadius = self.bdayButton.frame.height/2
        self.fbButton.layer.cornerRadius = self.fbButton.frame.height/2
        self.twitterButton.layer.cornerRadius = self.twitterButton.frame.height/2
        self.emailButton.layer.cornerRadius = self.emailButton.frame.height/2
        self.smsButton.layer.cornerRadius = self.smsButton.frame.height/2
        

    }
    
    class func instanceFromNib() -> UIView {
        return UINib(nibName: "InviteFriendsView", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! InviteFriendsView
    }

    private func initialSetup(){
        
        self.cancelButton.addTarget(self, action: #selector(cancelButtonTapped), for: .touchUpInside)
        self.bdayButton.addTarget(self, action: #selector(bdayButtonTapped), for: .touchUpInside)
        self.fbButton.addTarget(self, action: #selector(fbButtonTapped), for: .touchUpInside)
        self.twitterButton.addTarget(self, action: #selector(twitterButtonTapped), for: .touchUpInside)
        self.emailButton.addTarget(self, action: #selector(emailButtonTapped), for: .touchUpInside)
        self.smsButton.addTarget(self, action: #selector(smsButtonTapped), for: .touchUpInside)
        
    }
    
    
    func cancelButtonTapped(_ sender: UIButton) {
    }
   
    func bdayButtonTapped(_ sender: UIButton) {
    }
    
    func fbButtonTapped(_ sender: UIButton) {
    }
    
    func twitterButtonTapped(_ sender: UIButton) {
    }
    
    func emailButtonTapped(_ sender: UIButton) {
    }
    
    func smsButtonTapped(_ sender: UIButton) {
    }
}
