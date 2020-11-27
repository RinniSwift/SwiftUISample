
import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            HStack {
                VStack(alignment: .leading) {
                    HStack(alignment: .center, spacing: 15, content: {
                        Spacer()
                        Image(systemName: "chevron.backward")
                        Spacer()
                        Text("Placeholder")
                        Spacer()
                        Image(systemName: "chevron.forward")
                        Spacer()
                    })

                    Spacer()
                    Text("Middle Text")
                    Spacer()
                    Text("Bottom Text")
                    Spacer()
                }
                .preferredColorScheme(.dark)
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
