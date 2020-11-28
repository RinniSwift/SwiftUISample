import SwiftUI

struct SheetView: View {
    @Binding var showSheetView: Bool

    var body: some View {
        NavigationView {
            Text("Image Picker View")
        }
    }
}

struct SheetView_Previews: PreviewProvider {
    @State static var showSheetView = false

    static var previews: some View {
        SheetView(showSheetView: self.$showSheetView)
    }
}
