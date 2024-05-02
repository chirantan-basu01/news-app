import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageUpload extends StatefulWidget {
  const ImageUpload({super.key});

  @override
  State<ImageUpload> createState() => _ImageUploadState();
}

class _ImageUploadState extends State<ImageUpload> {
  Uint8List? _image;
  File? _selectedImage;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          // Todo: Checking
          _image != null
              ? AspectRatio(
                  aspectRatio: 12.0 / 9.0,
                  child: FittedBox(
                    fit: BoxFit.contain,
                    child: Image(
                      image: MemoryImage(_image!),
                    ),
                  ),
                )
              : IconButton(
                  onPressed: () {
                    showImagePickerOption(context);
                  },
                  icon: const Icon(
                    Icons.add_a_photo,
                    size: 65,
                  ),
                ),
        ],
      ),
    );
  }

  // Todo: Image Picking Options
  void showImagePickerOption(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: Colors.blue[100],
      context: context,
      builder: (builder) {
        return Padding(
          padding: const EdgeInsets.all(18.0),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 5.5,
            child: Row(
              children: [
                // Todo: Gallery
                Expanded(
                  child: InkWell(
                    onTap: () {
                      _pickImageFromGallery();
                    },
                    child: const SizedBox(
                      child: Column(
                        children: [
                          Icon(
                            Icons.image,
                            size: 50,
                          ),
                          Text("Gallery"),
                        ],
                      ),
                    ),
                  ),
                ),
                // Todo: Camera
                Expanded(
                  child: InkWell(
                    onTap: () {
                      _pickImageFromCamera();
                    },
                    child: const SizedBox(
                      child: Column(
                        children: [
                          Icon(
                            Icons.camera_alt,
                            size: 50,
                          ),
                          Text("Camera"),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  // Todo: Picking image From Gallery
  Future _pickImageFromGallery() async {
    final returnedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (returnedImage == null) {
      return;
    }
    setState(() {
      _selectedImage = File(returnedImage.path);
      _image = File(returnedImage.path).readAsBytesSync();
    });
    Navigator.of(context).pop();
  }

  // Todo: Picking image From Camera
  Future _pickImageFromCamera() async {
    final returnedImage =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (returnedImage == null) {
      return;
    }
    setState(() {
      _selectedImage = File(returnedImage.path);
      _image = File(returnedImage.path).readAsBytesSync();
    });
    Navigator.of(context).pop();
  }
}
