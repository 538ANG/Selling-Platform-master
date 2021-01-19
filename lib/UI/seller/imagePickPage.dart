import 'package:Selling_Platform/utils/services/image_picker_service.dart';
import 'package:Selling_Platform/utils/style/style.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';


class ImagePick extends StatefulWidget {
  @override
  _ImagePickState createState() => _ImagePickState();
}

class _ImagePickState extends State<ImagePick> {

  // ignore: missing_return
  Future _imageChoiceDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              title: Text("From where do you want to take the photo?"),
              content: SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    InkWell(
                      child: Text("Gallery"),
                      onTap: () {
                        _choosePic(context, ImageSource.gallery);
                        Navigator.pop(context);
                      },
                    ),
                    Padding(padding: EdgeInsets.all(12.0)),
                    InkWell(
                      child: Text("Camera"),
                      onTap: () {
                        _choosePic(context, ImageSource.camera);
                        Navigator.pop(context);
                      },
                    )
                  ],
                ),
              ));
        });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Selling Platform"),
        backgroundColor: backgroundColor1,
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _imageChoiceDialog,
        backgroundColor: backgroundColor1,
        icon: Icon(Icons.add_a_photo),
        label: Text("Take A Photo"),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  // TODO: fix this method's functionality
  Future<void> _choosePic(BuildContext context, source) async {
    try {
      // 1. Get image from picker
      final imagePicker =
      Provider.of<ImagePickerService>(context, listen: false);
      final file = await imagePicker.pickImage(source: source);
      // if (file != null) {
      //   // 2. Upload to storage
      //   final storage =
      //   Provider.of<FirebaseStorageService>(context, listen: false);
      //   final downloadUrl = await storage.uploadAvatar(file: file);
      //   // 3. Save url to Firestore
      //   final database = Provider.of<FirestoreService>(context, listen: false);
      //   await database.setAvatarReference(AvatarReference(downloadUrl));
      //   // 4. (optional) delete local file as no longer needed
      await file.delete();
    } catch (e) {
      print(e);
    }
  }
}