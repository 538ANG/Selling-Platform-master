import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerService {
  final imagePicker = ImagePicker();

  // Returns a [File] object pointing to the image that was picked.
  Future<File> pickImage({@required ImageSource source}) async {
    final pickedFile = await imagePicker.getImage(
        source: source,
        imageQuality: 100,
        maxHeight: 300,
        maxWidth: 300);
    return File(pickedFile.path);
  }
}

// Navigator.push(context, MaterialPageRoute(
// builder: (context) => PhotoResult(image: imageFile,)));




