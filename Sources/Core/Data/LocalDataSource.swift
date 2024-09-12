//
//  File.swift
//
//
//  Created by + on 3/5/1446 AH.
//

import Combine

public protocol LocalDataSource {
  associatedtype Request
  associatedtype Response

  func list(request: Request?) -> AnyPublisher<[Response], Error>
  func add(entities: [Response]) -> AnyPublisher<Bool, Error>
  func get(id: Int) -> AnyPublisher<Response, Error>
  func update(id: Int, entity: Response) -> AnyPublisher<Bool, Error>
}
