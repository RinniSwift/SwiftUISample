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
    private var gridItemLayout = [GridItem(.flexible()),
                                  GridItem(.flexible()),
                                  GridItem(.flexible())]

    var body: some View {
        NavigationView {
            HStack(alignment: .top) {
                ScrollView {
                    LazyVGrid(columns: gridItemLayout, spacing: 15) {
                        ForEach((sfSymbolNames.indices), id: \.self) {
                                Image(systemName: sfSymbolNames[$0])
                                    .font(.system(size: 30))
                                    .frame(width: 80, height: 80)
                                    .background(Color(.systemYellow))
                                    .cornerRadius(8)
                        }
                    }
                }
            }
            .navigationTitle("Instagram")
        }
        .preferredColorScheme(.dark)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
