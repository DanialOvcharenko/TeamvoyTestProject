

import SwiftUI

struct PostListView: View {
    
    @State var articles: [Articles] = []
    @State var model: Model!
    @State private var resultArray: [Articles] = []
    
    @StateObject private var api = Api()
    @State private var searchText = ""
    @State var authorName = ""
    
    @State var changedValue = "Swift"
    let spaceChanger = "%20"
    let space = " "
    
    
    var body: some View {
        NavigationView {
            List(articles, id: \.id) { (article) in
                NavigationLink(destination: DetailView(article: article), label: {
                    DeteilCell(article: article)
                    })
                               
            }
            .onAppear {

                api.searched = changedValue

                api.getPost { model in
                    articles = model.articles
                }
            }
            .searchable(text: $searchText)
            .onChange(of: searchText) { value in
                if value.last != " " {
                    changedValue = value.replacingOccurrences(of: space, with: spaceChanger)
                }
                if value.isEmpty {
                    changedValue = "Swift"
                } else {
                    
                    api.searched = changedValue
                    api.getPost { model in
                        articles = model.articles
                    }
                }
            }
            
            .navigationTitle("Articles")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    NavigationLink{
                        EnvelopeView()
                    } label: {
                        Label("Envelope", systemImage: "envelope")
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                Menu {
                    Button {
                        articles = articles.shuffled()
                    } label: {
                        Label("Shuffle", systemImage: "shuffle")
                    }

                    Menu {
                        Button {
                            articles = articles.sorted {
                                (article1, article2) -> Bool in
                                return article1.title ?? "" < article2.title ?? ""
                            }
                        } label: {
                            Label("Titles(A-Z)", systemImage: "arrow.down")
                        }
                        Button {
                            articles = articles.sorted {
                                (article1, article2) -> Bool in
                                return article1.title ?? "" > article2.title ?? ""
                            }
                        } label: {
                            Label("Titles(Z-A)", systemImage: "arrow.up")
                        }
                    } label: {
                        Label("By Title", systemImage: "text.bubble")
                    }

                    Menu {
                        Button {
                            articles = articles.sorted {
                                (article1, article2) -> Bool in
                                return article1.publishedAt ?? "" > article2.publishedAt ?? ""
                            }
                        } label: {
                            Label("From Now", systemImage: "arrow.down")
                        }

                        Button {
                            articles = articles.sorted {
                                (article1, article2) -> Bool in
                                return article1.publishedAt ?? "" < article2.publishedAt ?? ""
                            }
                        } label: {
                            Label("From Last", systemImage: "arrow.up")
                        }

                    } label: {
                        Label("By Date", systemImage: "calendar")
                    }

                    Menu {
                        Button {
                            articles = articles.sorted {
                                (article1, article2) -> Bool in
                                return article1.author ?? "" < article2.author ?? ""
                            }
                        } label: {
                            Label("Autors Name (A-Z)", systemImage: "arow.down")
                        }
                        
                        Button {
                            articles = articles.sorted {
                                (article1, article2) -> Bool in
                                return article1.author ?? "" > article2.author ?? ""
                            }
                        } label: {
                            Label("Autors Name (Z-A)", systemImage: "arow.up")
                        }
                        
                        Button {
                            alertSearching(title: "Searching", message: "Enter author name", hintText: "Steve Dent", primaryTitle: "Search", secondaryTitle: "Cancel") { text in
                                authorName = text
                                print(authorName)
                                articles = articles.filter({ (article) -> Bool in
                                    return article.author == searchText
                                })
                            } secondaryAction: {
                                print("Cancelled")
                            }

                        } label: {
                            Label("Enter Name", systemImage: "placeholdertext.fill")
                        }


                    } label: {
                        Label("By Author", systemImage: "person")
                    }

                } label: {
                    Label("Menu", systemImage: "line.3.horizontal")
                }
                }
                
            }
        }
    }
}

struct DeteilCell: View {
    
    var article: Articles
    
    var body: some View {
        VStack {
            Text(article.title ?? "")
                .fontWeight(.bold)
                .padding(.top, 10)
            Spacer()
                .frame(height: 15)
            Text(article.description ?? "")
                .lineLimit(12)
            Spacer()
            HStack {
                Spacer()
                Text(article.publishedAt ?? "")
            }
        }
    }
}

struct PostListView_Previews: PreviewProvider {
    static var previews: some View {
        PostListView()
    }
}




// MARK: - extension

extension View {
    func alertSearching(title: String, message: String, hintText: String, primaryTitle: String, secondaryTitle: String, primaryAction: @escaping (String)->(), secondaryAction: @escaping ()->()){
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addTextField { field in
            field.placeholder = hintText
        }
        
        alert.addAction(.init(title: secondaryTitle, style: .cancel, handler: { _ in
            secondaryAction()
        }))
        
        alert.addAction(.init(title: primaryTitle, style: .default, handler: { _ in
            if let text = alert.textFields?[0].text {
                primaryAction(text)
            } else {
                primaryAction("")
            }
        }))
        
        rootController().present(alert, animated: true, completion: nil)
        
    }
    
    func rootController()->UIViewController{
        guard let screen = UIApplication.shared.connectedScenes.first as? UIWindowScene else{
            return .init()
        }
        
        guard let root = screen.windows.first?.rootViewController else{
            return .init()
        }
        
        return root
    }
}


