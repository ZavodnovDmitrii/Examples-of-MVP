
import Foundation

protocol NetWorkServiceProtocol {
    func getComments(completion: @escaping(Result<[Comment], Error>) -> Void)
}

class NetWorckService: NetWorkServiceProtocol {
    func getComments(completion: @escaping (Result<[Comment], Error>) -> Void) {
        let urlString = "https://jsonplaceholder.typicode.com/comments"
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            do {
                let obj = try JSONDecoder().decode([Comment].self, from: data!)
                completion(.success(obj))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}
