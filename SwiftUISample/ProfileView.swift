import SwiftUI

private let postRatio = (UIScreen.main.bounds.width / 3) - 2

struct ProfileView: View {
    @State var showImagePicker = false
    @State var inputImage: UIImage?

    @State private var posts = [Image(systemName: "pencil.circle"),
                                Image(systemName: "folder.circle"),
                                Image(systemName: "paperplane.circle"),
                                Image(systemName: "tray.circle"),
                                Image(systemName: "tray.and.arrow.down"),
                                Image(systemName: "doc"),
                                Image(systemName: "calendar.badge.clock"),
                                Image(systemName: "arrowshape.zigzag.forward"),
                                Image(systemName: "book.circle"),
                                Image(systemName: "cloud.bolt.rain"),
                                Image(systemName: "cursorarrow.click.2")]
    private var gridItemLayout = Array(repeating: GridItem(.flexible(), spacing: 0),
                                       count: 3)

    var body: some View {
        NavigationView {
            HStack(alignment: .top) {
                ScrollView {
                    LazyVGrid(columns: gridItemLayout, spacing: 0) {
                        ForEach((posts.indices), id: \.self) {
                            posts[$0]
                                .frame(width: postRatio,
                                       height: postRatio,
                                       alignment: .center)
                                .background(Color(.systemYellow))
                                .padding(.all, 1)
                        }
                    }
                }
            }
            .navigationTitle("Instagram")
            .navigationBarItems(trailing:
                HStack(alignment: .center, content: {
                    Button(action: {
                            self.showImagePicker.toggle()
                    }, label: {
                        Image(systemName: "plus")
                    })
                })
            )
        }
        .sheet(isPresented: $showImagePicker, onDismiss: loadImage) {
            ImagePicker(image: self.$inputImage)
        }
    }

    func loadImage() {
        if let img = inputImage {
            let image = Image(uiImage: img).resizable()
            posts.append(image)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
