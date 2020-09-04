//
//  SwiftUIView.swift
//  temp1
//
//  Created by Zach Soles on 8/5/20.
//  Copyright © 2020 Zach Soles. All rights reserved.
//

import SwiftUI

struct MovieWatchListView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(entity: Student.entity(), sortDescriptors: []) var students: FetchedResults<Student>
    @ObservedObject private var movieWatchState = MovieDetailState()
    
    var body: some View {
        NavigationView {
            List{
                ForEach(students, id: \.id) { student in
                    NavigationLink(destination: MovieDetailView(movieId: Int(student.id))) {
                        WatchMovie(id: Int(student.id),name: student.name ?? "fuck", image: student.image ?? "fuck")
                    }
                }
                .onDelete { Students in
                    for index in Students {
                        self.moc.delete(self.students[index])
                    }
                }
            }
            .navigationBarTitle(Text("Watch List"))
        }
    }
}

struct WatchMovie: View {
    @ObservedObject private var movieWatchState = MovieDetailState()
    @ObservedObject var imageLoader = ImageLoader()
    let id: Int
    let name: String
    let image : String
    var body: some View {
        VStack{
            ZStack{
                Rectangle()
                    .fill(Color.gray.opacity(0.3))
                if self.imageLoader.image != nil{
                    Image(uiImage: self.imageLoader.image!)
                        .resizable()
                }
            }
            .aspectRatio(16/9, contentMode: .fit)
            .cornerRadius(8)
            .shadow(radius: 4)
            Text(name)
        }
        .onAppear {
            self.imageLoader.loadImage(with: URL(string: self.image)!)
        }
    }
}

struct MovieWatchListView_Previews: PreviewProvider {
    static var previews: some View {
        MovieWatchListView()
    }
}
