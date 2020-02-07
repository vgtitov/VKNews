//
//  FeedResponse.swift
//  VKNews
//
//  Created by it10 on 07/02/2020.
//  Copyright © 2020 Viachaslau Tsitou. All rights reserved.
//

import Foundation

struct  FeedResponseWrapped: Decodable {
    var  response: FeedResponse
}

struct  FeedResponse: Decodable {
    var  items: [FeedItem]
}

struct  FeedItem: Decodable {
    let sourseId: Int
    let postId: Int
    let text: String?
    let date: Double
    let comments: CountableItem?
    let likes: CountableItem?
    let reposts: CountableItem?
    let views: CountableItem?
}

struct  CountableItem: Decodable {
    let count: Int
}
