//
//  TasteCraftServerClient.swift
//  TasteCraft
//
//  Created by Valeryia Andraichuk on 18.11.23.
//

import Foundation

class TasteCraftServerClient {
    private static let serverURL = URLComponents(string: "http://localhost:8080")
    
    static func getAllRecipes(completion: @escaping (Result<[Recipe], Error>) -> Void) {
        guard var urlComponents = serverURL else {
            // Handle the case where the base URL is invalid
                return
        }
        urlComponents.path = "/recipe"
        guard let url = urlComponents.url else {
            // Handle the case where the final URL is invalid
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"

        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            guard let httpResponse = response as? HTTPURLResponse,
                (200...299).contains(httpResponse.statusCode) else {
                // Handle non-successful status code
                completion(.failure(NetworkError.invalidResponse))
                return
            }
            guard let data = data else {
                // Handle empty response
                completion(.success([]))
                return
            }
            do {
                let recipes = try JSONDecoder().decode([Recipe].self, from: data)
                completion(.success(recipes))
            } catch {
                // Handle JSON decoding error
                completion(.failure(error))
            }
        }
            .resume()
    }
    
    static func getRecipe(recipeId: Int, completion: @escaping (Result<Recipe?, Error>) -> Void) {
        guard var urlComponents = serverURL else {
            // Handle the case where the base URL is invalid
                return
        }
        urlComponents.path = "/recipe/\(recipeId)"
        guard let url = urlComponents.url else {
            // Handle the case where the final URL is invalid
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"

        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            guard let httpResponse = response as? HTTPURLResponse,
                (200...299).contains(httpResponse.statusCode) else {
                // Handle non-successful status code
                completion(.failure(NetworkError.invalidResponse))
                return
            }
            guard let data = data else {
                // Handle empty response
                completion(.success(nil))
                return
            }
            do {
                let recipes = try JSONDecoder().decode(Recipe.self, from: data)
                completion(.success(recipes))
            } catch {
                // Handle JSON decoding error
                completion(.failure(error))
            }
        }
            .resume()
    }
}
