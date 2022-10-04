//
//  PostDetailView.swift
//  TeamvoyTestProject
//
//  Created by Mac on 03.10.2022.
//

import SwiftUI

struct PostDetailView: View {
    
    var post: Post
    
    var body: some View {
        VStack {
            HStack{
                VStack(spacing: 10) {
                    Text(post.title)
                        .font(.title2)
                        .fontWeight(.semibold)
                        .lineLimit(4)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                    
                    HStack {
                        Label("\(post.viewCount)", systemImage: "eye.fill")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                    
                    Text(post.PostedAt)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                .padding()
                
                Image(post.imageName)
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(20)
                    .padding()
                
            }
            
            Spacer()
                .frame(height: 10)
            
            Text(post.description)
                .padding(.horizontal)
            
            Spacer()
            
        }
    }
}

struct PostDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PostDetailView(post: PostList.postsArr.first!)
    }
}
