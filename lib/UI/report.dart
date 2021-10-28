import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutterbeki_app/UI/post.dart';
import 'package:flutterbeki_app/authservice/connection.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutterbeki_app/localization/language_constants.dart';
import 'dart:io';

enum ImageSourceType { gallery, camera }

class Prob extends StatefulWidget {
  Prob({Key key}) : super(key: key);

  @override
  _ProbState createState() => _ProbState();
}

class _ProbState extends State<Prob> {
  final _formKey = GlobalKey<FormState>();
  var userName = "0989351728",
      message,
      problemImages,
      date = "Sebtember 3 2014";

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
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: ListView(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 30,
                width: 50,
              ),
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10)),
                  // border: Border.all(color: Colors.green[300], width: 2)
                ),
                child: Center(
                  child: Title(
                      color: Colors.blue,
                      child: Text(
                        "Report Problem",
                        style: TextStyle(
                            fontSize: 24,
                            color: Colors.green[300],
                            fontWeight: FontWeight.bold),
                      )),
                ),
              ),
              SizedBox(height: 10),
              Container(
                  child: Center(
                child: Image(
                    image: AssetImage("assets/report.jpg"), fit: BoxFit.cover),
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
                      color: Colors.green[200],
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
                      if (_formKey.currentState.validate()) {
                        AuthService()
                            .addproblem(
                          userName,
                          message,
                          problemImages,
                          date,
                        )
                            .then((val) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => dataFromDatabase(),
                              ));
                        });
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Successfully Send.')),
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
