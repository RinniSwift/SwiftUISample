import UIKit
import SwiftUI

struct SheetView: UIViewControllerRepresentable {
    @Environment(\.presentationMode) var presentationMode
    @Binding var image: UIImage?

    func makeUIViewController(context: UIViewControllerRepresentableContext<SheetView>) -> UIImagePickerController {
        let imgPicker = UIImagePickerController()
        imgPicker.delegate = context.coordinator
        return UIImagePickerController()
    }

    func updateUIViewController(_ uiViewController: UIImagePickerController,
                                context: UIViewControllerRepresentableContext<SheetView>) {
            // do something
    }

    func makeCoordinator() -> ImagePickerCoordinator {
        return ImagePickerCoordinator(parent: self)
    }
}

struct SheetView_Previews: PreviewProvider {
    @State static var image: UIImage?

    static var previews: some View {
        SheetView(image: self.$image)
    }
}

class ImagePickerCoordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    let parent: SheetView

    init(parent: SheetView) {
        self.parent = parent
    }

    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        guard let img = info[.originalImage] as? UIImage else {
            return
        }
        parent.image = img
        parent.presentationMode.wrappedValue.dismiss()
    }

}
