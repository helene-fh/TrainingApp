//
//  APIClient.swift
//  TestTrainingApp
//
//  Created by Helene Fogde Hejda on 2023-07-17.
//

import UIKit
import Combine

class ApiClient {
    private var baseURL = "https://stc.brpsystems.com/brponline/api/ver3/businessunits"
    private var cancellables = Set<AnyCancellable>()
    static let shared = ApiClient()
    
    private init(){
    }
    
    func fetchFromAPI<T: Decodable>(id: Int? = nil, endPoint: Endpoints, type: T.Type) ->
    
    Future<[T], Error> {
        return Future<[T], Error> { [weak self] promise in
            guard let self = self, let url = URL(string: self.baseURL.appending(id == nil ? "" : "/\(id ?? 0)").appending(endPoint.endPoint)) else {
           
                return promise(.failure(NetworkError.invalidURL))
            }
            print("URL PRINT -> \(url)")
            URLSession.shared.dataTaskPublisher(for: url)
                .tryMap { (data, response) -> Data in
                    guard let httpResponse = response as? HTTPURLResponse, 200...299 ~= httpResponse.statusCode else {
                        throw NetworkError.responseError
                    }
                    return data
                }
                .decode(type: [T].self, decoder: JSONDecoder())
                .receive(on: RunLoop.main)
                .sink(receiveCompletion: { (completion) in
                    if case let .failure(error) = completion {
                        switch error {
                        case let decodingError as DecodingError:
                            promise(.failure(decodingError))
                        case let apiError as NetworkError:
                            promise(.failure(apiError))
                        default:
                            promise(.failure(NetworkError.unknown))
                        }
                    }
                }, receiveValue: { promise(.success($0)) })
                .store(in: &self.cancellables)
        }
    }
}


