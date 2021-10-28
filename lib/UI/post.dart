import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutterbeki_app/UI/basic%20_info.dart';
import 'package:flutterbeki_app/UI/report.dart';
import 'package:flutterbeki_app/authservice/connection.dart';
import 'package:flutterbeki_app/localization/language_constants.dart';
import 'package:http/http.dart' as http;
import 'package:readmore/readmore.dart';

import 'package:intl/intl.dart';

import 'guest_page.dart';
import 'innovativeIdea.dart';

class dataFromDatabase extends StatefulWidget {
  @override
  _dataFromDatabaseState createState() => _dataFromDatabaseState();
}

class _dataFromDatabaseState extends State<dataFromDatabase> {
  bool liked = false;

  final _formKey = GlobalKey<FormState>();
  var comment, userName = "Belete", postId, date = "September 3 2014";

  getPostData() async {
    var response = await http
        .get(Uri.https('firstappwithheroku.herokuapp.com', 'getposts'));
    var jsonData = jsonDecode(response.body);
    List<post> users = [];
    for (var u in jsonData) {
      post user = post(u["_id"], u["postTitle"], u["postMessage"],
          u["postImages"], u["date"], u["postType"]);
      users.add(user);
    }
    // print("hello");
    // print(users.length);
    return users;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(getTranslated(context, 'post')),
        // backgroundColor: Colors.green[200],
        backgroundColor: Colors.green,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => GestPage(),
                    ));
              },
              icon: Icon(Icons.logout, color: Colors.white)),
        ],
      ),
      body: Container(
        child: Center(
          child: FutureBuilder(
            future: getPostData(),
            builder: (context, snapshot) {
              if (snapshot.data == null) {
                return Container(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              } else {
                var data = (snapshot.data as List<post>).toList();
                return ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (context, i) {
                      if (data[i].postType == "alert") {
                        return ListTile(
                          title: Card(
                            elevation: 10,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            color: Colors.white,
                            shadowColor: Colors.blueGrey,
                            child: Container(
                              child: Container(
                                margin: EdgeInsets.all(10),
                                child: Column(
                                  children: [
                                    //title: Text(snapshot.data.length),
                                    // Text(
                                    //   getTranslated(context, 'alert'),
                                    //   style: TextStyle(
                                    //       fontSize: 20,
                                    //       fontWeight: FontWeight.bold,
                                    //       color: Colors.red),
                                    // ),
                                    Container(
                                      margin: EdgeInsets.all(5),
                                      child: Text(
                                        data[i].postTitle,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18,
                                            color: Colors.red),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.all(5),
                                      child: ReadMoreText(
                                        data[i].postMessage,
                                        trimLines: 2,
                                        //colorClickableText: Colors.blue,
                                        trimMode: TrimMode.Line,
                                        trimCollapsedText:
                                            getTranslated(context, 'read_all'),
                                        trimExpandedText:
                                            getTranslated(context, 'hide_txt'),
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold),
                                        // moreStyle: TextStyle(
                                        //     fontSize: 14, fontWeight: FontWeight.bold,color: Colors.green),
                                        //  delimiterStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold,color: Colors.pink)
                                      ),
                                    ),
                                    Container(
                                      width: double.infinity,
                                      padding: EdgeInsets.all(10),
                                      child: ConstrainedBox(
                                        constraints: BoxConstraints(
                                          minWidth: 44,
                                          minHeight: 44,
                                        ),
                                        child: Image.network(
                                          data[i].postImages,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(bottom: 15),
                                      child: Text(data[i].date),
                                    ),
                                    Container(
                                      width: MediaQuery.of(context)
                                          .copyWith()
                                          .size
                                          .width,
                                      height: 50,
                                      child: TextFormField(
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return getTranslated(
                                                context, 'required_field');
                                          }
                                          return null;
                                        },
                                        onChanged: (val) {
                                          comment = val;
                                        },
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15)),
                                          suffixIcon: IconButton(
                                            color: Colors.blue,
                                            icon: Icon(Icons.send),
                                            onPressed: () {
                                              AuthService()
                                                  .comment(
                                                comment,
                                                userName,
                                                data[i].id,
                                                date,
                                              )
                                                  .then((val) {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          dataFromDatabase(),
                                                    ));
                                              });
                                              if (_formKey.currentState
                                                  .validate()) {
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  const SnackBar(
                                                      content: Text(
                                                          'Successfully Send.')),
                                                );
                                              }
                                            },
                                          ),
                                          hintText: getTranslated(
                                              context, 'write_comment'),
                                        ),
                                        keyboardType: TextInputType.name,
                                        textInputAction: TextInputAction.done,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      } else {
                        return ListTile(
                          title: Card(
                            elevation: 10,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            color: Colors.white,
                            shadowColor: Colors.black,
                            child: Container(
                              margin: EdgeInsets.all(10),
                              child: Column(
                                children: [
                                  //title: Text(snapshot.data.length),
                                  Container(
                                    margin: EdgeInsets.all(5),
                                    child: Text(
                                      data[i].postTitle,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                          color: Colors.black),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.all(5),
                                    child: ReadMoreText(
                                      data[i].postMessage,
                                      trimLines: 2,
                                      //colorClickableText: Colors.blue,
                                      trimMode: TrimMode.Line,
                                      trimCollapsedText:
                                          getTranslated(context, 'read_all'),
                                      trimExpandedText:
                                          getTranslated(context, 'hide_txt'),
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),

                                  Container(
                                    width: double.infinity,
                                    padding: EdgeInsets.all(10),
                                    child: ConstrainedBox(
                                      constraints: BoxConstraints(
                                        minWidth: 44,
                                        minHeight: 44,
                                      ),
                                      child: Image.network(
                                        data[i].postImages,
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(bottom: 15),
                                    child: Text(data[i].date),
                                  ),
                                  Container(
                                    width: MediaQuery.of(context)
                                        .copyWith()
                                        .size
                                        .width,
                                    height: 50,
                                    child: TextFormField(
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return getTranslated(
                                              context, 'required_field');
                                        }
                                        return null;
                                      },
                                      onChanged: (val) {
                                        comment = val;
                                      },
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                        suffixIcon: IconButton(
                                          color: Colors.blue,
                                          icon: Icon(Icons.send),
                                          onPressed: () {
                                            AuthService()
                                                .comment(
                                              comment,
                                              userName,
                                              data[i].id,
                                              date,
                                            )
                                                .then((val) {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        dataFromDatabase(),
                                                  ));
                                            });
                                            if (_formKey.currentState
                                                .validate()) {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                const SnackBar(
                                                    content: Text(
                                                        'Successfully Send.')),
                                              );
                                            }
                                          },
                                        ),
                                        hintText: getTranslated(
                                            context, 'write_comment'),
                                      ),
                                      keyboardType: TextInputType.name,
                                      textInputAction: TextInputAction.done,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }
                    });
              }
            },
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              //arrowColor: Colors.green[100],
              decoration: BoxDecoration(
                color: Colors.green[100],
                image: DecorationImage(
                  image: AssetImage("assets/background.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
              currentAccountPicture: CircleAvatar(
                child: ClipOval(
                  child: Image(
                    image: AssetImage("assets/farmer.jpg"),
                    width: 90,
                    height: 90,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              accountName: Text(
                getTranslated(context, 'profile_name'),
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 15),
              ),
              // accountEmail: Text('hilegiorgisbelete@gmail.com'),
            ),
            ListTile(
              tileColor: Colors.green[100],
              leading: Icon(Icons.engineering),
              title: Text(getTranslated(context, 'exploring_innovative_idea')),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context1) => Exploringidea()),
                );
              },
            ),
            ListTile(
              tileColor: Colors.green[100],
              leading: Icon(Icons.people),
              title: Text(getTranslated(context, 'basic_info')),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BasicInfo(),
                  ),
                );
              },
            ),
            ListTile(
              tileColor: Colors.green[100],
              leading: Icon(Icons.people),
              title: Text(getTranslated(context, 'report')),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Prob(),
                  ),
                );
              },
            ),
            ListTile(
              tileColor: Colors.green[100],
              leading: Icon(Icons.settings),
              title: Text(getTranslated(context, 'about')),
              onTap: () {
                showAboutDialog(
                    context: context,
                    applicationIcon: FlutterLogo(),
                    applicationVersion: ' V 0.0.1',
                    applicationName: 'EAIPC',
                    applicationLegalese: 'Developerrs',
                    children: <Widget>[
                      Text("Bereket Woldesilasie"),
                      Text("Belete Alehegn"),
                      Text("Bahiru Mulugeta"),
                      Text("Bekalu Getnet")
                    ]);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class post {
  final String id, postTitle, postMessage, postImages, date, postType;

  post(this.id, this.postTitle, this.postMessage, this.postImages, this.date,
      this.postType);

  @override
  String toString() =>
      'post(id,postTitle,postMessage,postImages,date: $id,postTitle,postMessage,postImages,date)';
}
