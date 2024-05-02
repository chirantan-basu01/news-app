import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfilePicture extends StatefulWidget {
  const ProfilePicture({super.key});

  @override
  State<ProfilePicture> createState() => _ImageUploadState();
}

class _ImageUploadState extends State<ProfilePicture> {
  Uint8List? _image;
  File? _selectedImage;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          // Todo: Profile Picture
          _image != null
              ? CircleAvatar(
              radius: 60,
              backgroundImage: MemoryImage(_image!),
          )
              : const CircleAvatar(
                  radius: 60,
                  backgroundImage: NetworkImage(
                    "https://media.istockphoto.com/id/1495088043/vector/user-profile-icon-avatar-or-person-icon-profile-picture-portrait-symbol-default-portrait.jpg?s=612x612&w=0&k=20&c=dhV2p1JwmloBTOaGAtaA3AW1KSnjsdMt7-U_3EZElZ0=",
                  ),
                ),
          Positioned(
            bottom: -7,
            left: 70,
            child: IconButton(
              onPressed: () {
                showImagePickerOption(context);
              },
              icon: const Icon(Icons.add_a_photo),
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
            height: MediaQuery.of(context).size.height / 4.5,
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
                            size: 70,
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
                            size: 70,
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
