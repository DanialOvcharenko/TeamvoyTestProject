

import SwiftUI

struct PostListView: View {
    
    @State var article: [Articles] = []
    
    @State var model: Model!
    
    @State var searchText = ""
    @State private var showingAlert = false
    @State var sorted = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach (article, id: \.id) { (article) in
                    VStack{
                        Text(article.title ?? "")
                            .fontWeight(.bold)
                            .padding(.top, 10)
                        Spacer()
                            .frame(height: 15)
                        Text(article.description ?? "")
                            .lineLimit(12)
                        
                        Divider()
                    }
                    .onTapGesture {
                        print("tapped article \(String(describing: article.title ?? "none"))")
                    }
                }
                .onAppear {
                    Api().getPost { model in
                        article = model.articles
                    }
                }
                .searchable(text: $searchText)
                .navigationBarTitle("Articles", displayMode: .inline)
                .toolbar {
                    Button("Sort") {
                        print("sort tapped")
                        //self.showingAlert = true
                        sorted = true
                        //print(sorted)
                    }
                    .alert(isPresented: $showingAlert) {
                        Alert(title: Text("Articles sorted by popularity"), message: nil, dismissButton: .cancel())
                    }
                }
                .navigationBarItems(trailing: Text(""))
            }
        }
    }
}

struct PostListView_Previews: PreviewProvider {
    static var previews: some View {
        PostListView()
    }
}


