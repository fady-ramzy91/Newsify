//
//  NewsifyAPIClient.swift
//  Newsify
//
//  Created by Fady Ramzy on 22/03/2026.
//

final class NewsifyAPIClient<ResponseType: Decodable>: APIClient {
  // MARK: - Shared Instance
  let shared: NewsifyAPIClient = NewsifyAPIClient()
  
  // MARK: - Initializer
  private init() {} // To be removed once we include factory
}
