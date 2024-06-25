import 'package:flutter/material.dart';

class NewPatient extends StatefulWidget {
  @override
  _NewPatientState createState() => _NewPatientState();
}

class _NewPatientState extends State<NewPatient> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? name, sex, place;
  int? age;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Patient'),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(labelText: 'Name'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter the patient\'s name';
                  }
                  return null;
                },
                onSaved: (value) {
                  name = value;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Sex'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter the patient\'s sex';
                  }
                  return null;
                },
                onSaved: (value) {
                  sex = value;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Age'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter the patient\'s age';
                  }
                  return null;
                },
                onSaved: (value) {
                  age = int.tryParse(value!);
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Place'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter the patient\'s place of residence';
                  }
                  return null;
                },
                onSaved: (value) {
                  place = value;
                },
              ),
              SizedBox(height: 100),
              Container(
                alignment: Alignment.bottomCenter,
                child: ElevatedButton(onPressed: (){Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            NewPatient()));}, child: Text("Register", style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold, color: Colors.white),), style: ButtonStyle( shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                    side: BorderSide.none, // No border
                  ),
                ), fixedSize: MaterialStateProperty.all<Size>(Size(300, 60)) ,backgroundColor: MaterialStateProperty.all<Color>(Colors.green)),),
              ),

            ],
          ),
        ),
      ),
    );
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      // You can now send the data to a server or use it for other purposes
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: Text('Registration Complete'),
          content: Text('Patient: $name, Sex: $sex, Age: $age, Place: $place'),
          actions: <Widget>[

          ],
        ),
      );
    }
  }
}