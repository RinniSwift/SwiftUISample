import SwiftUI

struct ContentView: View {
    private var sfSymbolNames = ["pencil.circle",
                                 "folder.circle",
                                 "paperplane.circle",
                                 "tray.circle",
                                 "tray.and.arrow.down",
                                 "doc",
                                 "calendar.badge.clock",
                                 "arrowshape.zigzag.forward",
                                 "book.circle",
                                 "cloud.bolt.rain",
                                 "cursorarrow.click.2"]
    private var gridItemLayout = Array(repeating: GridItem(.flexible(), spacing: 0),
                                       count: 3)

    var body: some View {
        NavigationView {
            HStack(alignment: .top) {
                ScrollView {
                    LazyVGrid(columns: gridItemLayout, spacing: 0) {
                        ForEach((sfSymbolNames.indices), id: \.self) {
                            Image(systemName: sfSymbolNames[$0])
                                .font(.system(size: 30))
                                .frame(minWidth: 0,
                                       maxWidth: .infinity,
                                       minHeight: 80,
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
                    Button(action: addImage, label: {
                        Image(systemName: "plus")
                    })
                })
            )
        }
        .preferredColorScheme(.dark)
    }

    func addImage() {
        print("User selected to add image")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
