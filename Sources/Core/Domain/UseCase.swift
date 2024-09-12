//
//  File.swift
//
//
//  Created by + on 3/5/1446 AH.
//

import Combine

public protocol UseCase {
  associatedtype Request
  associatedtype Response

  func execute(request: Request?) -> AnyPublisher<Response, Error>
}
