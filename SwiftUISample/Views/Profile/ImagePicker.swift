import UIKit
import SwiftUI

struct ImagePicker: UIViewControllerRepresentable {
    @Environment(\.presentationMode) var presentationMode
    @Binding var image: UIImage?

    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePicker>) -> UIImagePickerController {
        let imgPicker = UIImagePickerController()
        imgPicker.delegate = context.coordinator
        return imgPicker
    }

    func updateUIViewController(_ uiViewController: UIImagePickerController,
                                context: UIViewControllerRepresentableContext<ImagePicker>) {
            // do something
    }

    func makeCoordinator() -> ImagePickerCoordinator {
        return ImagePickerCoordinator(parent: self)
    }
}

struct SheetView_Previews: PreviewProvider {
    @State static var image: UIImage?

    static var previews: some View {
        ImagePicker(image: self.$image)
    }
}

class ImagePickerCoordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    let parent: ImagePicker

    init(parent: ImagePicker) {
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
