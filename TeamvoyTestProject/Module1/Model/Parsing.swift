

import Foundation
import SwiftUI

class Model: Codable {
    var articles: [Articles]!
    
    enum CodingKeys: String, CodingKey {
        case articles = "articles"
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.articles = try container.decodeIfPresent([Articles].self, forKey: .articles)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(articles, forKey: .articles)
    }
}


class Api {
    
    func getPost(completion: @escaping (Model) -> ()) {
        
        var url = URL(string: "https://newsapi.org/v2/everything?q=apple&apiKey=699258c470a9430aa7037e0bd0f0f7f6")!
        
        var request = URLRequest(url: url)
        
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        let session = URLSession.shared
        session.dataTask(with: request as URLRequest) {(data, response, error) in
            if let data = data,
               let results = try? JSONDecoder().decode(Model.self, from: data) {
                completion(results)
            }
        }.resume()
    }
}



