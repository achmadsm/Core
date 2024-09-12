//
//  File.swift
//
//
//  Created by + on 3/5/1446 AH.
//

public protocol Mapper {
  associatedtype Request
  associatedtype Response
  associatedtype Entity
  associatedtype Domain

  func transformResponseToEntity(request: Request?, response: Response) -> Entity
  func transformEntityToDomain(entity: Entity) -> Domain
}
