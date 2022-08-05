//
//  Comments.swift
//  PostHandler
//
//  Created by linto jacob on 05/08/22.
//

import Foundation

struct Comments: Codable {

  enum CodingKeys: String, CodingKey {
    case postId
    case email
    case body
    case name
    case id
  }

  var postId: Int?
  var email: String?
  var body: String?
  var name: String?
  var id: Int?

  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    postId = try container.decodeIfPresent(Int.self, forKey: .postId)
    email = try container.decodeIfPresent(String.self, forKey: .email)
    body = try container.decodeIfPresent(String.self, forKey: .body)
    name = try container.decodeIfPresent(String.self, forKey: .name)
    id = try container.decodeIfPresent(Int.self, forKey: .id)
  }

}
