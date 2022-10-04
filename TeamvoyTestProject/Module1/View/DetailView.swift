

import SwiftUI

struct DetailView: View {
    
    //var post = PostListView.article
    
    var body: some View {
        VStack {
            Spacer()
            VStack {
                Text("Title")
                Text("Description")
            }
            .padding()
            Divider()
            HStack {
                Text("Author")
                Spacer()
                Text("Date")
            }
            .padding()
            Spacer()
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView()
    }
}
