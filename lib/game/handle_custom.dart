import 'dart:io';
String imgName = "";
class HandleCustom  {

  /*Future<String?> chooseGalleryImage() async {
    await Permission.camera.request();
    final status = await Permission.manageExternalStorage.request();
    await Permission.storage.request();
    print(status);
    if (status.isGranted) {
      final pickedImage = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (pickedImage != null) {
        final imagePath = await saveImageToTemp(pickedImage.path);
        //final sprite = await loadGallerySprite(imagePath);
        // Create and add your SpriteComponent using the loaded sprite
        return imagePath;
      }
    } else {
      await Permission.storage.request();
      await Permission.camera.request();
      await Permission.manageExternalStorage.request();
      // Handle permission denied scenario (inform user)
      return "";
    }
    return null;
  }*/

  /*Future<String> saveImageToTemp(String imagePath) async {
    final directory = await getTemporaryDirectory();
    imgName = '${DateTime.now().millisecondsSinceEpoch}.png';
    final newPath = '${directory.path}/${DateTime.now().millisecondsSinceEpoch}.png';
    await File(imagePath).copy(newPath);
    return newPath;
  }*/
}
