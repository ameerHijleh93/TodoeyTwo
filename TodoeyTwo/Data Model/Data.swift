//
//  Data.swift
//  TodoeyTwo
//
//  Created by ameer on 5/9/18.
//  Copyright © 2018 ameer. All rights reserved.
//

import Foundation
import RealmSwift

class Data : Object {
    @objc dynamic var name : String = ""
    @objc dynamic var age: Int = 0
}
