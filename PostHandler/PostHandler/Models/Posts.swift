//
//  Posts.swift
//  PostHandler
//
//  Created by linto jacob on 05/08/22.
//

import Foundation

struct Posts: Codable {

  enum CodingKeys: String, CodingKey {
    case body
    case userId
    case title
    case id
  }

  var body: String?
  var userId: Int?
  var title: String?
  var id: Int?



  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    body = try container.decodeIfPresent(String.self, forKey: .body)
    userId = try container.decodeIfPresent(Int.self, forKey: .userId)
    title = try container.decodeIfPresent(String.self, forKey: .title)
    id = try container.decodeIfPresent(Int.self, forKey: .id)
  }

}
