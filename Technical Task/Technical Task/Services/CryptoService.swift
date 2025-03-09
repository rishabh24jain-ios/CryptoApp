import SwiftUI

 class APIService {
  static let shared = APIService()
  let baseUrl = "https://api.coingecko.com/api/v3/coins/"

  func fetchData<T: Decodable>(from urlString: String, completion: @escaping (Result<T, Error>) -> Void) {
    guard let url = URL(string: baseUrl+urlString) else {
      completion(.failure(NSError(domain: "Invalid URL", code: -1, userInfo: nil)))
      return
    }

    if let cachedResponse = URLCache.shared.cachedResponse(for: URLRequest(url: url)) {
      parseData(cachedResponse.data, completion: completion)
      return
    }

    let task = URLSession.shared.dataTask(with: url) { data, response, error in
      DispatchQueue.main.async {
        if let error = error {
          completion(.failure(error))
          return
        }

        guard let data = data, let response = response else {
          completion(.failure(NSError(domain: "Invalid Data", code: -1, userInfo: nil)))
          return
        }

        let cachedResponse = CachedURLResponse(response: response, data: data)
        URLCache.shared.storeCachedResponse(cachedResponse, for: URLRequest(url: url))

        self.parseData(data, completion: completion)
      }
    }
    task.resume()
  }

  private func parseData<T: Decodable>(_ data: Data, completion: @escaping (Result<T, Error>) -> Void) {
    do {
      let decodedData = try JSONDecoder().decode(T.self, from: data)
      completion(.success(decodedData))
    } catch {
      completion(.failure(error))
    }
  }
}

