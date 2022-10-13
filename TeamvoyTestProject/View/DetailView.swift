

import SwiftUI

struct DetailView: View {
    
    @Environment(\.openURL) var openURL
    @State var article: Articles!
    
    var body: some View {
        ScrollView {
            VStack {
                VStack {
                    Text(article.title ?? "no title")
                        .font(.system(size: 22))
                        .fontWeight(.bold)
                        .padding(.bottom, 10)
                    AsyncImage(url: URL(string: article.urlToImage ?? "")) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                    } placeholder: {
                        ProgressView()
                            .foregroundColor(.gray)
                            .frame(height: 100)
                    }
                    .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
                }
                .padding(.horizontal)
                Spacer()
                    .frame(height: 20)
                
                VStack(alignment: .trailing) {
                    HStack {
                        Text(article.author ?? "Author")
                        Image(systemName: "person.fill")
                    }
                    Spacer()
                        .frame(width: 8)
                    HStack {
                        Text(article.publishedAt ?? "")
                        Image(systemName: "timer")
                    }
                    
                }
                .padding(.horizontal)
                Divider()
                
                Text(article.description ?? "Description")
                    .padding()
                Spacer()
                
                Button{
                    openURL(URL(string: article.url ?? "")!)
                } label: {
                    Text("watch at browser")
                        .foregroundColor(.green)
                }
                    .padding()
                    .background(Color(red: 0, green: 0, blue: 0.5))
                    .clipShape(Capsule())
            }
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView()
    }
}
