//
//  MockAPIManager.swift
//  Mkodo-Lottery-AppTests
//
//  Created by Ramanath Suthakar on 12/08/2024.
//

import Foundation
@testable import Mkodo_Lottery_App

class MockAPIManager: APIManaging {
    enum MockResponse {
        case success
        case failure
    }
    
    var response: MockResponse
    
    init(response: MockResponse = .success) {
        self.response = response
    }
    
    func execute<Value>(_ request: Request<Value>, completion: @escaping (Result<Value, APIError>) -> Void) where Value : Decodable {
        switch response {
        case .success:
            let json = """
            {
                "draws": [
                    {
                        "id": "draw-1",
                        "drawDate": "2023-05-15",
                        "number1": "2",
                        "number2": "16",
                        "number3": "23",
                        "number4": "44",
                        "number5": "47",
                        "number6": "52",
                        "bonus-ball": "14",
                        "topPrize": 4000000000
                    }
                ]
            }
            """.data(using: .utf8)!
            
            let decoder = JSONDecoder()
            do {
                let response = try decoder.decode(Value.self, from: json)
                completion(.success(response))
            } catch {
                completion(.failure(.parsingError))
            }
        case .failure:
            completion(.failure(.networkError))
        }
    }
}

