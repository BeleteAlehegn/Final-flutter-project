import 'package:flutter/material.dart';
import 'package:flutterbeki_app/model/info.dart';

class BasicInfo extends StatelessWidget {
  final List<Info> infoList = Info.getInfos();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Farmers Basic Information'),
        backgroundColor: Colors.green[200],
      ),
      backgroundColor: Colors.green[100],
      body: ListView.builder(
        itemCount: infoList.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            elevation: 9.5,
            color: Colors.green[100],
            child: ListTile(
              leading: CircleAvatar(
                child: ClipOval(
                  child: Image(
                    image: AssetImage("assets/searchicon.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              trailing: Text("..."),
              title: Text(infoList[index].title),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BasicInfoDetail(
                      infoName: infoList.elementAt(index).title,
                      info: infoList[index],
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class BasicInfoDetail extends StatelessWidget {
  final String infoName;
  final Info info;

  const BasicInfoDetail({Key key, this.infoName, this.info}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("info"), backgroundColor: Colors.green[100]),
      body: Container(
        child: SafeArea(
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            children: <Widget>[
              Container(
                height: 100,
                width: MediaQuery.of(context).copyWith().size.width / 1,
                child: Text(
                  info.title,
                  style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.green[300]),
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                height: 200,
                width: MediaQuery.of(context).copyWith().size.width / 1,
                child: Image(
                  image: AssetImage(info.images),
                  width: 450,
                  height: 200,
                ),
              ),
              Text(
                info.description,
                style: TextStyle(
                  fontSize: 20,
                ),
                textAlign: TextAlign.left,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
