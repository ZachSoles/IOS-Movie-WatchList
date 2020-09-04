//
//  MovieListState.swift
//  temp1
//
//  Created by Zach Soles on 8/3/20.
//  Copyright © 2020 Zach Soles. All rights reserved.
//

import Foundation

class MovieListState: ObservableObject {
    @Published var movies: [Movie]?
    @Published var isLoading = false
    @Published var error: NSError?
    
    private let movieService: MovieService
    
    init(movieService: MovieService = MovieStore.shared){
        self.movieService = movieService
    }
    
    func loadMovies(with endpoint: MovieListEndpoint){
        self.movies = nil
        self.isLoading = false
        self.movieService.fetchMovies(from: endpoint) { [weak self] (result) in
            guard let self = self else {return}
            self.isLoading = false
            switch result {
            case.success(let response):
                self.movies = response.results
            case.failure(let error):
                self.error = error as NSError
            }
        }
    }
}
