//
//  Request.swift
//  Newsify
//
//  Created by Fady Ramzy on 20/03/2026.
//

import Foundation

enum HTTPMethod: String {
  case get = "GET"
  case post = "POST"
  case patch = "PATCH"
  case put = "PUT"
  case delete = "DELETE"
}

protocol APIRequest {
  var path: String { get }
  var httpMethod: HTTPMethod { get }
  var parameters: [String: any Any & Sendable]? { get }
  var headers: [String: any Any & Sendable]? { get }
}
