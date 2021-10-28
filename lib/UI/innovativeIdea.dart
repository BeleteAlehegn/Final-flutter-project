import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutterbeki_app/UI/post.dart';
import 'package:flutterbeki_app/authservice/connection.dart';

enum ImageSourceType { gallery, camera }

class Exploringidea extends StatefulWidget {
  Exploringidea({Key key}) : super(key: key);

  @override
  _ExploringideaState createState() => _ExploringideaState();
}

class _ExploringideaState extends State<Exploringidea> {
  final _formKey = GlobalKey<FormState>();
  var message, innovationImages = 'innovativeImages', date = '30/12/2013';
  Widget _buildbutton() {
    return Container(
      width: 400,
      child: RaisedButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Text(
            "Submit",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          color: Colors.green[300],
          onPressed: () {}),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[50],
      body: Container(
        padding: EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              Container(
                padding: EdgeInsets.all(0),
                child: Center(
                  child: Title(
                      color: Colors.blue,
                      child: Text(
                        "Explore innovation",
                        style: TextStyle(
                            fontSize: 24,
                            color: Colors.green,
                            fontWeight: FontWeight.bold),
                      )),
                ),
              ),
              SizedBox(height: 10),
              Container(
                  child: Center(
                child: Image(
                    image: AssetImage("assets/inov.jpg"), fit: BoxFit.cover),
              )),
              SizedBox(
                height: 20,
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: TextFormField(
                  minLines: 6,
                  maxLines: 20,
                  keyboardType: TextInputType.multiline,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Must be write some description!!!';
                    }
                    return null;
                  },
                  onChanged: (val) {
                    message = val;
                  },
                  decoration: InputDecoration(
                    hintText: 'Description....',
                    hintStyle: TextStyle(
                      color: Colors.blue,
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    )),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Container(
                width: 350,
                child: RaisedButton(
                    child: Text("Submmit"),
                    color: Colors.green[300],
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    onPressed: () {
                      AuthService()
                          .addinnovativeidea(
                        message,
                        innovationImages,
                        date,
                      )
                          .then((val) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => dataFromDatabase(),
                            ));
                      });
                      print(message);
                      if (_formKey.currentState.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text('Successfull Submission.')),
                        );
                      }
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
