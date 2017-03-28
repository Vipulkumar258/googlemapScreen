//
//  Generics.swift
//  Bday
//
//  Created by Appinventiv on 27/03/17.
//  Copyright © 2017 Appinventiv. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    
    var tableViewCell : UITableViewCell?{
        
        var cell = self
        while !(cell is UITableViewCell){
            
            guard let s = cell.superview else { return nil }
            cell = s
            
        }
        return cell as? UITableViewCell
    }
    
    var headerOrFooterView : UICollectionReusableView?{
        
        var header = self
        while !(header is UICollectionReusableView){
            
            guard let s = header.superview else { return nil }
            header = s
            
        }
        return header as? UICollectionReusableView
    }
    
    var collectionViewCell : UICollectionViewCell?{
        
        var cell = self
        while !(cell is UICollectionViewCell){
            
            guard let s = cell.superview else{ return nil }
            cell = s
            
        }
        return cell as? UICollectionViewCell
    }
    
}
