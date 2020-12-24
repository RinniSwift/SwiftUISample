import SwiftUI

private let postRatio = (UIScreen.main.bounds.width / 3) - 2

struct ProfileView: View {
    @State var showImagePicker = false
    @State var inputImage: UIImage?
    var storageManager = StorageManager()

    @State private var posts = [Image]()
    private var gridItemLayout = Array(repeating: GridItem(.flexible(), spacing: 0),
                                       count: 3)

    var body: some View {
        NavigationView {
            HStack(alignment: .top) {
                ScrollView {
                    LazyVGrid(columns: gridItemLayout, spacing: 0) {
                        ForEach((posts.indices), id: \.self) {
                            posts[$0]
                                .aspectRatio(contentMode: .fill)
                                .frame(width: postRatio,
                                       height: postRatio,
                                       alignment: .center)
                                .background(Color(.systemYellow))
                                .clipped()
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
        .sheet(isPresented: $showImagePicker, onDismiss: addImage) {
            ImagePicker(image: self.$inputImage)
        }
        .onAppear(perform: loadPosts)
    }

    func loadPosts() {
        do {
            let images = try storageManager.retrievePosts()
            posts = images.map({ Image(uiImage: $0) })
        } catch {
            print("Error retreiving posts from FileManager -- \(error)")
        }
    }

    func addImage() {
        if let img = inputImage {
            let image = Image(uiImage: img).resizable()
            posts.append(image)
        }

        // resets image back
        inputImage = nil
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
