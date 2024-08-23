import 'package:fire_base_class/Model/model_class.dart';
import 'package:fire_base_class/Services/service.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class AddPlaceScreen extends StatefulWidget {
  @override
  _AddPlaceScreenState createState() => _AddPlaceScreenState();
}


class _AddPlaceScreenState extends State<AddPlaceScreen> {
  PlacesServices _services = PlacesServices();


  final _nameController = TextEditingController();
  final _locationController = TextEditingController();
  final _descriptionController = TextEditingController();
  File? _imageFile;


  Future<void> _pickImage() async {
    final pickedFile =
    await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
  }


  Future<void> _uploadPlace() async {
    if (_imageFile != null) {
      final storageRef = FirebaseStorage.instance
          .ref()
          .child('places/${_nameController.text}');
      final uploadImage = storageRef.putFile(_imageFile!);
      final imageUrl = await (await uploadImage).ref.getDownloadURL();


      final newPlace = PlaceModel(
        id: '',
        name: _nameController.text,
        location: _locationController.text,
        imageUrl: imageUrl,
        description: _descriptionController.text,
      );


      await _services.addPlace(newPlace);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add a New Place'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                  controller: _nameController,
                  decoration: InputDecoration(labelText: 'Place Name')),
              TextField(
                  controller: _locationController,
                  decoration: InputDecoration(labelText: 'Location')),
              TextField(
                  controller: _descriptionController,
                  decoration: InputDecoration(labelText: 'Description')),
              SizedBox(height: 20),
              ElevatedButton(onPressed: _pickImage, child: Text('Pick Image')),
              SizedBox(height: 20),
              _imageFile != null ? Image.file(_imageFile!) : Container(),
              SizedBox(height: 20),
              ElevatedButton(
                  onPressed: () {
                    _uploadPlace();
                    Get.back();
                  },
                  child: Text('Add Place')),
            ],
          ),
        ),
      ),
    );
  }
}
