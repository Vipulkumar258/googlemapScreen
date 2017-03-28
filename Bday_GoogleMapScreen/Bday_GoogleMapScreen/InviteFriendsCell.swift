//
//  InviteFriendsCell.swift
//  Bday
//
//  Created by Appinventiv on 25/03/17.
//  Copyright © 2017 Appinventiv. All rights reserved.
//

import UIKit

class InviteFriendsCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var nextArrowButton: UIButton!
    @IBOutlet weak var firstFriendButton: UIButton!
    @IBOutlet weak var secondFriendButton: UIButton!
    @IBOutlet weak var moreFriendsButton: UIButton!
    @IBOutlet weak var moreFriendsCountLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()

        initialSetup()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func firstFriendButtonTapped(_ sender: UIButton) {
        
    }
    
    @IBAction func secondFriendButtonTapped(_ sender: UIButton) {
        
    }
    
    @IBAction func moreFriendsButtonTapped(_ sender: UIButton) {
        
    }
 
    private func initialSetup(){
    
        self.firstFriendButton.layer.cornerRadius = self.firstFriendButton.frame.width/2
        self.secondFriendButton.layer.cornerRadius = self.secondFriendButton.frame.width/2
        self.moreFriendsButton.layer.cornerRadius = self.moreFriendsButton.frame.width/2
    
    }
}
