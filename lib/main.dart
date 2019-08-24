import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:routing/new_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
    theme: ThemeData(
      primaryColor: defaultTargetPlatform == TargetPlatform.iOS ? Colors.grey[200]: Colors.orange[200],
    ),
    home: HomePage(),
    // routes: <String, WidgetBuilder>{
    //   '/a': (BuildContext context) => NewPage("New Page"),
    //   '/b': (BuildContext context) => NewPage("New Page2"),
    // },
    debugShowCheckedModeBanner: false,
  );
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text("Routing app"),
      elevation: defaultTargetPlatform == TargetPlatform.iOS ? 0.0 : 3.5,
    ),
    drawer: Drawer(
      child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text("Jose Melendez"),
            accountEmail: Text("jose.melendezbolanos@gmail.com"),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.cyan[200],
              child: Text("J", style: TextStyle(color: Colors.blue[900])),
            ),
            otherAccountsPictures: <Widget>[
              CircleAvatar(
                backgroundColor: Colors.cyan[200],
                child: Text("M", style: TextStyle(color: Colors.blue[900])),
              ),
              CircleAvatar(
                backgroundColor: Colors.cyan[200],
                child: Text("D", style: TextStyle(color: Colors.blue[900])),
              ),
            ],
          ),
          ListTile(
            title: Text("Page one"),
            trailing: Icon(Icons.arrow_upward),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).pushNamed("/a");
            } ,
          ),
          ListTile(
            title: Text("Page two"),
            trailing: Icon(Icons.arrow_downward),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) => NewPage("Page two")
                ),              
              );
            },
          ),
          Divider(
            color: Colors.black,
          ),
          ListTile(
            trailing: Icon(Icons.close),
            title: Text("Close"),
            onTap: () => Navigator.of(context).pop(),           
          ),
        ],
      ),
    ),
    body: Container(
      child: Center(
        child: Text("Home page"),
      ),
    ),
  );
}