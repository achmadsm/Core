//
//  File.swift
//
//
//  Created by + on 3/5/1446 AH.
//

import Combine
import Foundation

public class GetListPresenter<
  Request,
  Response,
  Interactor: UseCase
>: ObservableObject where

  Interactor.Request == Request,
  Interactor.Response == [Response] {
  private var cancellables: Set<AnyCancellable> = []

  private let useCase: Interactor

  @Published public var list: [Response] = []
  @Published public var errorMessage: String = ""
  @Published public var isLoading: Bool = false
  @Published public var isError: Bool = false

  public init(useCase: Interactor) {
    self.useCase = useCase
  }

  public func getList(request: Request?) {
    isLoading = true
    useCase.execute(request: request)
      .receive(on: RunLoop.main)
      .sink(receiveCompletion: { completion in
        switch completion {
        case let .failure(error):
          self.errorMessage = error.localizedDescription
          self.isError = true
          self.isLoading = false
        case .finished:
          self.isLoading = false
        }
      }, receiveValue: { list in
        self.list = list
      })
      .store(in: &cancellables)
  }
}
