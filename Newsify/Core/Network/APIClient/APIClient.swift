//
//  APIClient.swift
//  Newsify
//
//  Created by Fady Ramzy on 20/03/2026.
//

import Foundation
import Alamofire

// MARK: - Protocol
protocol APIClient {
  associatedtype ResponseType
  
  func fetchRequest(with request: APIRequest) async throws -> ResponseType
}

// MARK: - Default Implementation
extension APIClient where ResponseType: Decodable {
  func fetchRequest(with request: APIRequest) async throws -> ResponseType {
    let httpMethod = Alamofire.HTTPMethod(rawValue: request.httpMethod.rawValue)
    let httpHeaders: HTTPHeaders? = if let headers = request.headers {
      HTTPHeaders(headers.compactMapValues { $0 as? String })
    } else {
      nil
    }
    
    let response = await AF.request(
      request.path,
      method: httpMethod,
      parameters: request.parameters,
      headers: httpHeaders
    )
    .serializingDecodable(ResponseType.self)
    .response
    
    switch response.result {
    case .success(let data):
      return data
    case .failure(let error):
      throw error
    }
  }
}
