import 'package:flutter/material.dart';

class help extends StatefulWidget {
  help({Key key}) : super(key: key);

  @override
  _helpState createState() => _helpState();
}

class _helpState extends State<help> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("How to use?"),
        backgroundColor: Colors.green,
      ),
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
            child: Column(
              children: [
                Center(
                  child: Text(
                    "ይህን መተግበሪያ በቀላል ለመጠቀም የሚከተሉተን መመሪያ የተግብሩ!",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text("1. ይህን መተግበሪያ ለመጠቀም የሚፈልጉትን ቋንቋ ይምረጡ!"),
                SizedBox(
                  height: 5,
                ),
                Image(
                  image: AssetImage('assets/help/lang1.png'),
                  fit: BoxFit.cover,
                ),
                Image(
                  image: AssetImage('assets/help/lang2.png'),
                  fit: BoxFit.cover,
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                    "2. ይህን መተግበሪያ ሲጠቀሙ የመጀመሪያዎ ከሆነ እና አካውንት መፍጠር ከፈለጉ አካውንት ፍጠር የሚለውን በመጫን የሚመጣልዎትን ሳጥን በሙሉ ትክክለኛ መረጃ በማስገባት ተመዝገብ የሚለውን ይጫኑ! "),
                SizedBox(
                  height: 5,
                ),
                Image(
                  image: AssetImage('assets/help/createAccount1.png'),
                  fit: BoxFit.cover,
                ),
                Image(
                  image: AssetImage('assets/help/createAccount2.png'),
                  fit: BoxFit.cover,
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                    "3. አካውንት ከፈጠሩ በኋላ ሁለቱ ሳጥኖች ላይ ስልክ ቁጥርዎትን እና የይለፍ የተመዘገቡበትን የይለፍ ቃል በማስገባት ግባ የሚለውን ይጫኑ!"),
                SizedBox(
                  height: 5,
                ),
                Image(
                  image: AssetImage('assets/help/login.png'),
                  fit: BoxFit.cover,
                ),
                Text("4. እርስዎ በገቡበት ሌላ ሰው እንዳይገባ አካውንትዎን ዘግተው ለመውጣት"),
                SizedBox(
                  height: 5,
                ),
                Image(
                  image: AssetImage('assets/help/logout.png'),
                  fit: BoxFit.cover,
                ),
                Text("5. የተለያዩ አማራጮችን ለማምጣት እና ከተዘረዘሩት መካከል አንዱን ምረጡ"),
                SizedBox(
                  height: 5,
                ),
                Image(
                  image: AssetImage('assets/help/menu1.png'),
                  fit: BoxFit.cover,
                ),
                Image(
                  image: AssetImage('assets/help/navigation.png'),
                  fit: BoxFit.cover,
                ),
                Text("6. አስቸኳይ ሁነቶች ማቀበል ይፈልጋሉ?"),
                SizedBox(
                  height: 5,
                ),
                Image(
                  image: AssetImage('assets/help/reportproblem.png'),
                  fit: BoxFit.cover,
                ),
                Text(
                    "7. አካውንት ከሌለዎት እና ለጊዜው አካውንት መፍጠር ካልፈለጉ እንደ እንግዳ ይግቡ የሚለውን በመንካት የሚመጣልዎትን ዝርዝር በመጫን መሰረታዊ የግብርና መረጃዎችን ያግኙ!"),
                SizedBox(
                  height: 5,
                ),
                Image(
                  image: AssetImage('assets/help/basicinfo1.png'),
                  fit: BoxFit.cover,
                ),
                Image(
                  image: AssetImage('assets/help/basicinfo2.png'),
                  fit: BoxFit.cover,
                ),
                Text("8. የፈጠራ ስራ አለዎት? ካለዎት "),
                Image(
                  image: AssetImage('assets/help/innovative.png'),
                  fit: BoxFit.cover,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
