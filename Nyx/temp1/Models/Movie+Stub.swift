//
//  Movie+Stub.swift
//  temp1
//
//  Created by Zach Soles on 8/2/20.
//  Copyright © 2020 Zach Soles. All rights reserved.
//

import Foundation

extension Movie{
    static var stubbedMovies: [Movie] {
        let response: MovieResponse? = try? Bundle.main.loadAndDecodeJson(fileName: "movie_list")
        return response!.results
    }
    
    static var stubbedMovie: Movie{
        stubbedMovies[0]
    }
}

extension Bundle{
    func loadAndDecodeJson<D: Decodable>(fileName: String) throws -> D? {
        guard let url = self.url(forResource: fileName, withExtension: "json") else {
            return nil
        }
        let data = try Data(contentsOf: url)
        let jsonDecoder = Utils.jsonDecoder
        let decodedModel = try jsonDecoder.decode(D.self, from: data)
        return decodedModel
    }
}
