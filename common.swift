//
//  common.swift
//  FurryFriends
//
//  Created by Gina Hou on 2/10/15.
//  Copyright (c) 2015 Yahoo. All rights reserved.
//

import UIKit

func CGAffineTransformMakeDegreeRotation(rotation: CGFloat) -> CGAffineTransform {
    return CGAffineTransformMakeRotation(rotation * CGFloat(M_PI / 100))
}
