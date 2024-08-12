//
//  DrawsViewModel.swift
//  Mkodo-Lottery-App
//
//  Created by Ramanath Suthakar on 12/08/2024.
//

import Foundation

enum DrawsViewModelState {
    case loading
    case loaded([Draw])
    case error
    
    var draws: [Draw] {
        switch self {
        case .loaded(let draws):
            return draws
        case .loading, .error:
            return []
        }
    }
}

final class DrawsViewModel: DrawsViewModelProtocol {

    private let apiManager: APIManaging

    init(apiManager: APIManaging = APIManager()) {
        self.apiManager = apiManager
        self.state = .loading
    }

    var updatedState: (() -> Void)?

    @Published var state: DrawsViewModelState {
        didSet {
            self.updatedState?()
        }
    }

    func fetchDraws() {
        apiManager.execute(Draw.drawDetails()) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let draws):
                self.state = .loaded(draws.draws)
            case .failure:
                self.state = .error
            }
        }
    }
}


