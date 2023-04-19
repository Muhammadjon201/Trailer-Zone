//
//  YoutTube search response.swift
//  Trailer Zone
//
//  Created by ericzero on 4/19/23.
//

import UIKit

struct YouTubeSearchResponse: Codable {
    let items: [VideoElement]
}

struct VideoElement: Codable {
    let id: IdVideoElement
}

struct IdVideoElement: Codable {
    let kind: String
    let videoId: String
}
