import 'package:flutter/material.dart';
import 'package:flutterbeki_app/UI/basic%20_info.dart';
import 'package:flutterbeki_app/UI/post.dart';
import 'package:flutterbeki_app/UI/regstration.dart';
import 'package:flutterbeki_app/classes/language.dart';
import 'package:flutterbeki_app/localization/language_constants.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../main.dart';
import 'help.dart';

class GestPage extends StatefulWidget {
  GestPage({Key key}) : super(key: key);

  @override
  _GestPageState createState() => _GestPageState();
}

class _GestPageState extends State<GestPage> {
  void _changeLanguage(Language language) async {
    Locale _locale = await setLocale(language.languageCode);
    MyApp.setLocale(context, _locale);
  }

  final List<String> imageList = [
    "assets/slide/1.jpg",
    "assets/slide/2.jfif",
    "assets/slide/3.jpeg",
    "assets/slide/4.jpg",
    "assets/slide/5.jpg",
    // "https://ujg433eawlo3i4uqknhm8e1b-wpengine.netdna-ssl.com/wp-content/uploads/2020/04/90496546_m-scaled.jpg",
    // "https://ujg433eawlo3i4uqknhm8e1b-wpengine.netdna-ssl.com/wp-content/uploads/2020/04/90496546_m-scaled.jpg",
    // "https://ujg433eawlo3i4uqknhm8e1b-wpengine.netdna-ssl.com/wp-content/uploads/2020/04/90496546_m-scaled.jpg",
    // "https://ujg433eawlo3i4uqknhm8e1b-wpengine.netdna-ssl.com/wp-content/uploads/2020/04/90496546_m-scaled.jpg",
  ];

  void _showSuccessDialog() {
    showTimePicker(context: context, initialTime: TimeOfDay.now());
  }

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  bool _obscureText = true;
  String _password;
  String _phonenumber;
  var phone, password, token;
  String dropdownvalue = 'Flutter';
  Widget _buildSignup() {
    return Container(
      width: 400,
      child: Container(
        padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
        child: Row(children: <Widget>[
          Text(
            getTranslated(
              context,
              'have_account',
            ),
            style: TextStyle(
              fontSize: 15,
            ),
          ),
          FlatButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FormScreen(),
                ),
              );
            },
            child: Flexible(
              child: Text(
                getTranslated(context, 'createAcc'),
                overflow: TextOverflow.fade,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          )
        ]),
      ),
    );
  }

  Widget _buildPassword() {
    return TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
        labelText: getTranslated(context, 'pass'),
        suffixIcon: GestureDetector(
          onTap: () {
            setState(() {
              _obscureText = !_obscureText;
            });
          },
          child: Icon(_obscureText ? Icons.visibility : Icons.visibility_off),
        ),
      ),
      validator: (String value) {
        if (value.isEmpty) {
          return getTranslated(context, 'required_field');
        }
        return null;
      },
      onSaved: (String value) {
        _password = value;
      },
      obscureText: _obscureText,
    );
  }

  Widget _buildbutton() {
    return Container(
      width: 400,
      child: RaisedButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Text(
          getTranslated(context, 'login'),
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        color: Colors.green[300],
        onPressed: () {
          if (!_formkey.currentState.validate()) {
            return;
          }
          _formkey.currentState.save();
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => dataFromDatabase(),
            ),
          );
        },
      ),
    );
  }

  Widget _buildPhone() {
    return Container(
      child: TextFormField(
        maxLength: 20,
        keyboardType: TextInputType.numberWithOptions(),
        decoration: InputDecoration(
            prefixIcon: Icon(Icons.phone),
            labelText: getTranslated(context, 'phone'),
            prefixText: '+251',
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
            fillColor: Colors.white,
            filled: true),
        validator: (String value) {
          if (value.isEmpty) {
            return getTranslated(context, "required_field");
          }
          return null;
        },
        onChanged: (val) {
          phone = val;
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.green, actions: <Widget>[
        Padding(
          padding: const EdgeInsets.all(
            8.0,
          ),
          child: Row(
            children: [
              FlatButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => help(),
                        ));
                  },
                  child: Text(
                    getTranslated(context, 'help'),
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  )),
              DropdownButton(
                  onChanged: (Language language) {
                    _changeLanguage(language);
                  },
                  underline: SizedBox(),
                  icon: Icon(Icons.language, color: Colors.black),
                  items: Language.languagelist()
                      .map<DropdownMenuItem<Language>>(
                        (lang) => DropdownMenuItem(
                          value: lang,
                          child: Row(
                            children: <Widget>[
                              Text(lang.flag),
                              Text(lang.name)
                            ],
                          ),
                        ),
                      )
                      .toList()),
            ],
          ),
        ),
      ]),
      body: Container(
        decoration: BoxDecoration(color: Colors.white),
        child: Form(
          key: _formkey,
          child: ListView(
            children: <Widget>[
              SizedBox(height: 5),
              Padding(
                  padding: EdgeInsets.only(left: 15.0, right: 15.0),
                  child: Center(
                    child: Column(
                      children: <Widget>[
                        Container(
                            child: Column(
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Center(
                              child: CarouselSlider(
                                options: CarouselOptions(
                                  enlargeCenterPage: true,
                                  enableInfiniteScroll: false,
                                  autoPlay: true,
                                ),
                                items: imageList
                                    .map((e) => ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          child: Stack(
                                            fit: StackFit.expand,
                                            children: <Widget>[
                                              Image.asset(
                                                e,
                                                width: 400,
                                                height: 200,
                                                fit: BoxFit.cover,
                                              )
                                            ],
                                          ),
                                        ))
                                    .toList(),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(getTranslated(context, 'EAIDAS'),
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 30,
                                    color: Colors.green[300],
                                    fontStyle: FontStyle.italic,
                                    fontWeight: FontWeight.bold)),
                            SizedBox(height: 10),
                            _buildPhone(),
                            _buildPassword(),
                            SizedBox(
                              height: 15,
                            ),
                            _buildbutton(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: 100,
                                  margin: EdgeInsets.all(0),
                                  padding: EdgeInsets.all(0),
                                  child: Flexible(
                                    child: Text(
                                      getTranslated(context, 'have_account'),
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.black,
                                      ),
                                      overflow: TextOverflow.fade,
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 150,
                                  margin: EdgeInsets.all(5),
                                  padding: EdgeInsets.all(5),
                                  child: FlatButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => FormScreen(),
                                        ),
                                      );
                                    },
                                    child: Flexible(
                                      child: Text(
                                        getTranslated(context, 'createAcc'),
                                        overflow: TextOverflow.fade,
                                        style: TextStyle(
                                          color: Colors.blue[600],
                                          fontSize: 18,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 0,
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => BasicInfo(),
                                    ));
                              },
                              child: Text(
                                getTranslated(context, 'skip'),
                                style:
                                    TextStyle(fontSize: 20, color: Colors.blue),
                              ),
                            ),
                          ],
                        )),
                      ],
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
