//
//  MovieBackdropCarouselView.swift
//  temp1
//
//  Created by Zach Soles on 8/2/20.
//  Copyright © 2020 Zach Soles. All rights reserved.
//

import SwiftUI

struct MovieBackdropCarouselView: View {
    
    let title: String
    let movies: [Movie]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text(title)
                .font(.title)
                .fontWeight(.bold)
                .padding(.horizontal)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 16) {
                    ForEach (self.movies) { movie in
                        NavigationLink(destination: MovieDetailView(movieId: movie.id)) {
                        MovieBackdropCard(movie: movie)
                            .frame(width: 272, height: 200)
                            
                        }
                    .buttonStyle(PlainButtonStyle ())
                    }
                }.padding()
            }
        }
    }
}

struct MovieBackdropCarouselView_Previews: PreviewProvider {
    static var previews: some View {
        MovieBackdropCarouselView(title: "Latest", movies: Movie.stubbedMovies)
    }
}
