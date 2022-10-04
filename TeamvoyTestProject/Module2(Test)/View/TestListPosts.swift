

import SwiftUI

struct TestListPosts: View {
    
    @State var posts: [Post] = PostList.postsArr
    
    @State private var buttonPressed = false
    @State private var searchText = ""
    @State private var showingMessage = false
    
    var filteredPosts: [Post] {
        if searchText == "" { return posts }
        return posts.filter {
            $0.title.lowercased().contains(searchText.lowercased())
        }
    }
    
    var body: some View {
        NavigationView{
            List(filteredPosts, id: \.id) { post in
                NavigationLink(destination: PostDetailView(post: post), label: {
                    
                    PostCell(post: post)
                    
                })
            }
            .navigationBarTitle("Posts", displayMode: .inline)
            .searchable(text: $searchText)
        }
    }
}


struct PostCell: View {
    
    var post: Post
    
    var body: some View {
        HStack {
            Spacer()
            VStack{
                HStack{
                    Text(post.title)
                        .fontWeight(.bold)
                        .lineLimit(2)
                    Spacer()
                    Text("Views: \(post.viewCount)")
                }
                Spacer()
                Text(post.description)
                    .lineLimit(8)
            }
            .padding(.vertical, 8)
            Spacer()
        }
    }
}

struct TestListPosts_Previews: PreviewProvider {
    static var previews: some View {
        TestListPosts()
    }
}


// For sorting
// return posts.sorted { $0.viewCount > $1.viewCount }
