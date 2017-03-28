//
//  PlaceModel.swift
//  Bday_GoogleMapScreen
//
//  Created by Appinventiv on 27/03/17.
//  Copyright © 2017 Appinventiv. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
import AlamofireImage

struct PlacesModel {
    
    var place_id : String = ""
    var description : String = ""
    
    init(withJSON json: JSON) {
        
        self.place_id = json["place_id"].stringValue
        self.description = json["description"].stringValue
        
    }
    
}

