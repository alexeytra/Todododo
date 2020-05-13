//
//  Category.swift
//  Todododo
//
//  Created by Алексей Трапезников on 13.05.2020.
//  Copyright © 2020 Алексей Трапезников. All rights reserved.
//

import Foundation
import RealmSwift

class Category: Object {
    @objc dynamic var name: String = ""
    let items = List<Item>()
}

