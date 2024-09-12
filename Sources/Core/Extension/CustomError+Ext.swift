//
//  File.swift
//
//
//  Created by + on 3/5/1446 AH.
//

import Foundation

public enum URLError: LocalizedError {
  case invalidRequest
  case invalidResponse
  case addressUnreachable(URL)

  public var errorDescription: String? {
    switch self {
    case .invalidRequest: return "Request is null."
    case .invalidResponse: return "The server responded with garbage."
    case let .addressUnreachable(url): return "\(url.absoluteString) is unreachable."
    }
  }
}

public enum DatabaseError: LocalizedError {
  case invalidInstance
  case requestFailed

  public var errorDescription: String? {
    switch self {
    case .invalidInstance: return "Database can't instance."
    case .requestFailed: return "Your request failed."
    }
  }
}
