//
//  ScrollViewVC.swift
//  Bday
//
//  Created by Appinventiv on 24/03/17.
//  Copyright © 2017 Appinventiv. All rights reserved.
//

import UIKit

class EventContentView: UIView {
    
    @IBOutlet weak var eventsButton: UIButton!
    @IBOutlet weak var detailsButton: UIButton!
    @IBOutlet weak var rsvpsButton: UIButton!
    @IBOutlet weak var scrollIndicatorView: UIView!
    @IBOutlet weak var mainScrollView: UIScrollView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.initialSetup()
    }
    
    override func layoutSubviews() {
        
        self.mainScrollView.frame.size.width = self.frame.width
        
        self.mainScrollView.contentSize = CGSize(width: self.frame.width * 3,
                                                 height: self.mainScrollView.frame.height)
    }
    
    class func instanceFromNib() -> UIView {
        return UINib(nibName: "EventContentView", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! EventContentView
    }
    
    func eventsButtonTapped(_ sender: UIButton) {
        
        UIView.animate(withDuration: 0.3,
                       delay: 0,
                       options: .showHideTransitionViews,
                       animations: {
                        
                        self.mainScrollView.contentOffset.x = 0
                        //                        self.setButtonsDeselected()
                        //                        self.eventsButton.isSelected = !self.eventsButton.isSelected
                        
        }, completion: nil)
        
    }
    
    func detaillsButtonTapped(_ sender: UIButton) {
        
        UIView.animate(withDuration: 0.3,
                       delay: 0,
                       options: .showHideTransitionViews,
                       animations: {
                        
                        self.mainScrollView.contentOffset.x = self.mainScrollView.frame.width
                        //                        self.setButtonsDeselected()
                        //                        self.detailsButton.isSelected = !self.detailsButton.isSelected
                        
        }, completion: nil)
    }
    
    func rsvpsButtonTapped(_ sender: UIButton) {
        
        UIView.animate(withDuration: 0.3,
                       delay: 0,
                       options: .showHideTransitionViews,
                       animations: {
                        
                        self.mainScrollView.contentOffset.x = self.mainScrollView.frame.width*2
                        //                        self.setButtonsDeselected()
                        //                        self.rsvpsButton.isSelected = !self.rsvpsButton.isSelected
                        
        }, completion: nil)
    }
    
    private func initialSetup(){
        
        self.mainScrollView.delegate = self
        
        self.eventsButton.isSelected = true
        
        self.eventsButton.addTarget(self, action: #selector(eventsButtonTapped), for: .touchUpInside)
        self.detailsButton.addTarget(self, action: #selector(detaillsButtonTapped), for: .touchUpInside)
        self.rsvpsButton.addTarget(self, action: #selector(rsvpsButtonTapped), for: .touchUpInside)
                
    }
    
    func setButtonsDeselected(){
        
        self.eventsButton.isSelected = false
        self.detailsButton.isSelected = false
        self.rsvpsButton.isSelected = false
        
    }
}

extension EventContentView : UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let multiplier = self.frame.width/self.eventsButton.frame.width
        let scrollPositionForX = scrollView.contentOffset.x
        self.scrollIndicatorView.transform = CGAffineTransform(translationX:scrollPositionForX/multiplier, y: 0)
        
        if scrollPositionForX >= 0 && scrollPositionForX < scrollView.frame.width {
            
            self.setButtonsDeselected()
            self.eventsButton.isSelected = !self.eventsButton.isSelected
            
        }else if scrollPositionForX >= scrollView.frame.width && scrollPositionForX < (scrollView.frame.width*2){
            
            self.setButtonsDeselected()
            self.detailsButton.isSelected = !self.detailsButton.isSelected
            
        }else{
            
            self.setButtonsDeselected()
            self.rsvpsButton.isSelected = !self.rsvpsButton.isSelected
        }
        
    }
}
