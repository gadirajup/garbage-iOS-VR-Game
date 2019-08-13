//
//  Int+Helpers.swift
//  Garbage
//
//  Created by Prudhvi Gadiraju on 8/12/19.
//  Copyright © 2019 Prudhvi Gadiraju. All rights reserved.
//

import UIKit

extension Int {
    func toRadians() -> CGFloat {
        return CGFloat(self) * (CGFloat.pi / 180)
    }
}
