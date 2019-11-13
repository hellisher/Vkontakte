//
//  FriendPhotoResponse.swift
//  Vkontakte
//
//  Created by Валерий Эль-Хатиб on 31.10.2019.
//  Copyright © 2019 EVM Corporation. All rights reserved.
//

import Foundation

class FriendPhotoResponse: Decodable {
    let count: Int = 0
    let items: [FriendPhotoURL]
}
