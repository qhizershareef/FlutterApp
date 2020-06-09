import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


final GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();

class Forme extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
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
            decoration: InputDecoration(labelText: "Name"),
            validators: [
              FormBuilderValidators.max(70),
            ],
          ),
           FormBuilderTextField(
            attribute: "phone",
            decoration: InputDecoration(labelText: "Phone"),
            validators: [
              FormBuilderValidators.numeric(),
            ],
          ),
           FormBuilderTextField(
            attribute: "optional",
            decoration: InputDecoration(labelText: "Optional Phone"),
            validators: [
              FormBuilderValidators.numeric(),
            ],
          ),
          FormBuilderTextField(
            attribute: "email",
            decoration: InputDecoration(labelText: "E-mail"),
            validators: [
              FormBuilderValidators.max(70),
            ],
          ),
           FormBuilderTextField(
            attribute: "referral",
            decoration: InputDecoration(labelText: "Referral Number"),
            validators: [
              FormBuilderValidators.numeric(),
            ],
          ),
           FormBuilderTextField(
            attribute: "address",
            decoration: InputDecoration(labelText: "Address"),
            validators: [
              FormBuilderValidators.max(70),
            ],
          ),
           FormBuilderDropdown(
            attribute: "selected",
            decoration: InputDecoration(labelText: "Select Mode of Payment"),
            // initialValue: 'Male',
            hint: Text('Choose one'),
            validators: [FormBuilderValidators.required()],
            items: ['UPI', 'Net Banking', 'Cash on Delivery']
              .map((selected) => DropdownMenuItem(
                 value: selected,
                 child: Text("$selected")
            )).toList(),
          ),
        ],
      ),
    ),
    Row(
      children: <Widget>[
        MaterialButton(
          child: Text("Submit"),
          onPressed: () {
            if (_fbKey.currentState.saveAndValidate()) {
              Firestore.instance
              .collection('Medical')
              .document(_fbKey.currentState.value['name'])
              .setData({
                  'name': _fbKey.currentState.value['name'],
                  'phone': _fbKey.currentState.value['phone'],
                  'optional': _fbKey.currentState.value['optional'],
                  'email': _fbKey.currentState.value['email'],
                  'referral': _fbKey.currentState.value['referral'],
                  'address': _fbKey.currentState.value['address'],
                  'selected': _fbKey.currentState.value['selected'],
              });
            }
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
}

































/*import 'package:flutter/material.dart';  
import 'package:file_picker/file_picker.dart';


class MyApp extends StatelessWidget {  
  @override  
  Widget build(BuildContext context) {  
    final appTitle = 'Flutter Form Demo';  
    return MaterialApp(  
      title: appTitle,  
      home: Scaffold(  
        appBar: AppBar(  
          title: Text(appTitle),  
        ),  
        body: MyCustomForm(),  
      ),  
    );  
  }  
}  
// Create a Form widget.  
class MyCustomForm extends StatefulWidget {  
  @override  
  MyCustomFormState createState() {  
    return MyCustomFormState();  
  }  
}  
// Create a corresponding State class. This class holds data related to the form.  
class MyCustomFormState extends State<MyCustomForm> {  
  // Create a global key that uniquely identifies the Form widget  
  // and allows validation of the form.  
  final _formKey = GlobalKey<FormState>();  
  
  @override  
  Widget build(BuildContext context) {  
    // Build a Form widget using the _formKey created above.  
    return Form(  
      key: _formKey, 
      autovalidate: true, 
      child: ListView(    
        children: <Widget>[  
          TextFormField(  
            decoration: const InputDecoration(  
              icon: const Icon(Icons.person),  
              hintText: 'Enter your name',  
              labelText: 'Name',  
            ),
            validator: ,  
          ),  
          TextFormField(  
            decoration: const InputDecoration(  
              icon: const Icon(Icons.phone),  
              hintText: 'Enter a phone number',  
              labelText: 'Phone',  
            ), 
             
          ),  
          TextFormField(  
            decoration: const InputDecoration(  
              icon: const Icon(Icons.phone),  
              hintText: 'Enter a phone number',  
              labelText: 'Optional Phone ',  
            ),  
          ),  
          TextFormField(  
            decoration: const InputDecoration(  
            icon: const Icon(Icons.email),  
            hintText: 'Enter your Email',  
            labelText: 'E-mail',  
            ),  
           ), 
           TextFormField(  
            decoration: const InputDecoration(  
            icon: const Icon(Icons.people),  
            hintText: 'Enter your referral',  
            labelText: 'Referral Number',  
            ),  
           ),  
          /*  new Container(  
              padding: const EdgeInsets.only(left: 50.0, top: 40.0),  
              child: RaisedButton(
          onPressed: () {},
          textColor: Colors.white,
          padding: const EdgeInsets.all(0.0),
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: <Color>[
                  Color(0xFF1976D2),
                  Color(0xFF42A5F5),
                ],
              ),
            ),
            padding: const EdgeInsets.all(8.0),
            child: const Text(
              'Choose Files',
              style: TextStyle(fontSize: 20)
            ),
          ),
        )),*/
              TextFormField(  
            decoration: const InputDecoration(  
            icon: const Icon(Icons.home),  
            hintText: 'Enter your Address',  
            labelText: 'Address',  
            ),  
           ),  
          Center(
            child: new Container(  
                padding: const EdgeInsets.only(left: 20.0, top: 40.0),  
                child: RaisedButton(
            onPressed: () {},
            textColor: Colors.black,
            padding: const EdgeInsets.all(0.0),
             child: const Text(
                'Submit',
                style: TextStyle(fontSize: 20)
              ),
        )),
          ),  
        ],  
      ),  
    );  
  }  
}  */