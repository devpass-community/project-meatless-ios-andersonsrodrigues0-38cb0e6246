import Foundation

typealias RestaurantCompletion = ([Restaurant]?)->Void

struct Service {
    private let api = "https://raw.githubusercontent.com/devpass-tech/meatless-api/main/restaurant_list.json"
    
    func fetchRestaurantList(completion: @escaping RestaurantCompletion) {
        guard let url = URL(string: api) else {
            return
        }
        
        let session = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                dump(error)
                return completion(nil)
            }
            
            guard let response = response as? HTTPURLResponse,
                  (200...299).contains(response.statusCode) else {
                return completion(nil)
            }
            
            guard let data = data else {
                return completion(nil)
            }
            
            DispatchQueue.main.async {
                let model = handleDataParse(data)
                completion(model)
            }
        }
        session.resume()
    }
}

// MARK: Private functions
private extension Service {
    func handleDataParse(_ data: Data) -> [Restaurant]? {
        do {
            let json = JSONDecoder()
            json.keyDecodingStrategy = .convertFromSnakeCase
            let model = try json.decode([Restaurant].self, from: data)
            return model
        } catch {
            dump(error)
            return nil
        }
    }
}
