//
//  File.swift
//
//
//  Created by + on 3/5/1446 AH.
//

import Combine
import Foundation

public class SearchPresenter<
  Response,
  Interactor: UseCase
>: ObservableObject where

  Interactor.Request == String,
  Interactor.Response == [Response] {
  private var cancellables: Set<AnyCancellable> = []

  private let useCase: Interactor

  @Published public var list: [Response] = []
  @Published public var errorMessage: String = ""
  @Published public var isLoading: Bool = false
  @Published public var isError: Bool = false

  public var keyword = ""

  public init(useCase: Interactor) {
    self.useCase = useCase
  }

  public func search() {
    isLoading = true
    useCase.execute(request: keyword)
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
