import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart' as Path;
import 'package:fluttertoast/fluttertoast.dart';

//final FirebaseStorage _storage = FirebaseStorage.instance;
//bool _isUploading = false;
//bool _isCompletedUploading = false;
final GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();

class Forme extends StatefulWidget {
  @override
  _FormeState createState() => _FormeState();
}

class _FormeState extends State<Forme> {
  File _image;
  File _image2;
  // File _image;
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        FormBuilder(
          key: _fbKey,
          initialValue: {
            'date': DateTime.now(),
            'accept_terms': false,
          },
          autovalidate: true,
          child: Column(
            children: <Widget>[
              FormBuilderTextField(
                attribute: "name",
                decoration: InputDecoration(
                    labelText: "Name", prefixIcon: Icon(Icons.person)),
                validators: [FormBuilderValidators.required()],
              ),
              FormBuilderTextField(
                attribute: "phone",
                decoration: InputDecoration(
                    labelText: "Phone", prefixIcon: Icon(Icons.phone)),
                validators: [
                  FormBuilderValidators.numeric(),
                  FormBuilderValidators.required()
                ],
              ),
              FormBuilderTextField(
                attribute: "optional",
                decoration: InputDecoration(
                    labelText: "Optional Phone", prefixIcon: Icon(Icons.phone)),
                validators: [
                  FormBuilderValidators.numeric(),
                ],
              ),
              FormBuilderTextField(
                attribute: "email",
                decoration: InputDecoration(
                    labelText: "E-mail", prefixIcon: Icon(Icons.email)),
                validators: [FormBuilderValidators.required()],
              ),
              FormBuilderTextField(
                attribute: "referral",
                decoration: InputDecoration(
                    labelText: "Referral Number",
                    prefixIcon: Icon(Icons.people)),
                validators: [
                  FormBuilderValidators.numeric(),
                ],
              ),
              FormBuilderTextField(
                attribute: "address",
                decoration: InputDecoration(
                    labelText: "Address", prefixIcon: Icon(Icons.home)),
                validators: [FormBuilderValidators.required()],
              ),
              FormBuilderDropdown(
                attribute: "selected",
                decoration: InputDecoration(
                    labelText: "Select Mode of Payment",
                    prefixIcon: Icon(Icons.payment)),
                hint: Text('Choose one'),
                validators: [FormBuilderValidators.required()],
                items: ['UPI', 'Net Banking', 'Cash on Delivery']
                    .map((selected) => DropdownMenuItem(
                        value: selected, child: Text("$selected")))
                    .toList(),
              ),
              SizedBox(height: 20),
              Text("Upload Prescription"),
              MaterialButton(
                child: Text("Upload"),
                onPressed: () {
                  _loadImage();
                },
              ),
              Text("Upload Prescription 2"),
              MaterialButton(
                child: Text("Upload"),
                onPressed: () {
                  _loadImage2();
                },
              ),
            ],
          ),
        ),
        SizedBox(height: 20),
        Row(
          children: <Widget>[
            MaterialButton(
              child: Text("Submit"),
              onPressed: () {
                _submitButton();
              },
            ),
            MaterialButton(
              child: Text("Reset"),
              onPressed: () {
                _fbKey.currentState.reset();
              },
            ),
          ],
        )
      ],
    );
  }

  void _loadImage() async {
    var image = await ImagePicker()
        .getImage(source: ImageSource.gallery, imageQuality: 70);
    if (image != null) {
      setState(() {
        _image = File(image.path);
      });
      Fluttertoast.showToast(
          msg: "Image 1 Uploaded",
          toastLength: Toast.LENGTH_SHORT,
          timeInSecForIosWeb: 5,
          backgroundColor: Colors.blue,
          gravity: ToastGravity.CENTER,
          textColor: Colors.white);
    } else {
      Fluttertoast.showToast(
          msg: "Please Select Image",
          toastLength: Toast.LENGTH_SHORT,
          timeInSecForIosWeb: 5,
          backgroundColor: Colors.red,
          gravity: ToastGravity.CENTER,
          textColor: Colors.white);
    }
  }

  void _loadImage2() async {
    var image = await ImagePicker()
        .getImage(source: ImageSource.gallery, imageQuality: 70);
    if (image != null) {
      setState(() {
        _image2 = File(image.path);
      });

      Fluttertoast.showToast(
          msg: "Image 2 Uploaded",
          toastLength: Toast.LENGTH_SHORT,
          timeInSecForIosWeb: 5,
          backgroundColor: Colors.blue,
          gravity: ToastGravity.CENTER,
          textColor: Colors.white);
    } else {
      Fluttertoast.showToast(
          msg: "Please Select Image",
          toastLength: Toast.LENGTH_SHORT,
          timeInSecForIosWeb: 5,
          backgroundColor: Colors.red,
          gravity: ToastGravity.CENTER,
          textColor: Colors.white);
    }
  }

  void _submitButton() async {
     var currDt = DateTime.now();
     String formatted='${currDt.day}/${currDt.month}/${currDt.year}';
    //uploading to firestore
    print("inside");
    //var name=_fbKey.currentState.value['name'];
    if (_fbKey.currentState.saveAndValidate()) {
      Firestore.instance
          .collection('Medical')
          .document(_fbKey.currentState.value['name'])
          .setData({
        'name': _fbKey.currentState.value['name'],
        'Phone': _fbKey.currentState.value['phone'],
        'optional': _fbKey.currentState.value['optional'],
        'email': _fbKey.currentState.value['email'],
        'referral': _fbKey.currentState.value['referral'],
        'Address': _fbKey.currentState.value['address'],
        'selected': _fbKey.currentState.value['selected'],
        'orderDate': formatted,
      });
      print('uploaded to firestore ' + _fbKey.currentState.value['name'] );
      uploadFile(_fbKey.currentState.value['name']);
    }
  }

  uploadFile(name) async {
    if(name != null){
     StorageReference storageReference = FirebaseStorage.instance
        .ref()
        .child(name + '/${Path.basename(_image.path)}');
    StorageUploadTask uploadTask = storageReference.putFile(_image);
    await uploadTask.onComplete;
    //print('File Uploaded')

    StorageReference storageReference2 = FirebaseStorage.instance
        .ref()
        .child(name + '/${Path.basename(_image2.path)}');
    StorageUploadTask uploadTask2 = storageReference2.putFile(_image2);
    await uploadTask2.onComplete;
    //print('File 2 Uploaded');

    storageReference.getDownloadURL().then((fileURL2) {
      print(fileURL2 + 'file 2 uploaded');
    });

    Fluttertoast.showToast(
        msg: "Uploaded Successfully",
        toastLength: Toast.LENGTH_SHORT,
        timeInSecForIosWeb: 7,
        backgroundColor: Colors.green,
        gravity: ToastGravity.CENTER,
        textColor: Colors.white);
    storageReference.getDownloadURL().then((fileURL) {
      print(fileURL + 'file 1 uploaded');
    }); 
    }
    else{
      print("no-------------------");
    }
  }
}
