import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sih_app_2/screens/guided_pre.dart';
import 'package:sih_app_2/screens/home/Home.dart';
import 'login.dart';
import 'package:sih_app_2/services/sigin.dart';
import 'package:sih_app_2/screens/ocr.dart';
import 'package:sih_app_2/screens/auto_pre.dart';


class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SIH APP") ,
        elevation: defaultTargetPlatform == TargetPlatform.android ? 5.0 : 0.0 ,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.person_outline),
            onPressed: (){
                  signOutGoogle();
                  Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) {return LoginPage();}), ModalRoute.withName('/'));
                },
          )
        ],
      ),
      drawer:Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text(name),
              accountEmail:Text( email),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(imageUrl),
                backgroundColor: Colors.grey[100],
              ),
            ),
            ListTile(
              leading: Icon(Icons.mic),
              title: Text("Make a Guided Prescription"),
              trailing: Icon(Icons.forward),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(
                   MaterialPageRoute(
                     builder : ( BuildContext context ) => Home())) ;
              }
            ),
            Divider() , 
            ListTile(
              leading: Icon(Icons.mic),
              title: Text("Make Fully Automated Prescription"),
              trailing: Icon(Icons.forward),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(
                   MaterialPageRoute(
                     builder : ( BuildContext context ) => AutoPrescription())) ;
              }
            ),
            Divider() , 
            ListTile(
              leading: Icon(Icons.camera_enhance),
              title: Text("Scan A Prescription"),
              trailing: Icon(Icons.forward),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(
                   MaterialPageRoute(
                     builder : ( BuildContext context ) => MLHome()
                  )
                ) ;
              }
            ),
            Divider() ,
            ListTile(
              leading: Icon(Icons.book),
              title: Text("History"),
              trailing: Icon(Icons.forward),
              onTap: () {
                Navigator.of(context).pop();
              }
            ),
            Divider() ,
            ListTile(
              leading: Icon(Icons.transit_enterexit),
              title: Text("SignOut"),
              trailing: Icon(Icons.forward),
              onTap: () {
                Navigator.of(context).pop();
                signOutGoogle();
                  Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) {return LoginPage();}), ModalRoute.withName('/'));
                
              }
            ),
            Divider(
              height: 30,
            ) ,
            ListTile(
              title: Text("Close"),
              trailing: Icon(Icons.close),
              onTap: () => Navigator.of(context).pop(),
            ),
            Divider(),
            
          ],
        ),
      ) ,

      body:  ListView(
          children: <Widget>[
            Padding(padding: EdgeInsets.all(10),),
               Card(
                 elevation: 10,
                child: Container(
                  decoration: BoxDecoration(
                  gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Colors.red[200] , Colors.red[50]]
                )
              ),
                  child: Column(
                    children: <Widget>[
                      ListTile(
                        leading: CircleAvatar(
                           backgroundImage: NetworkImage(imageUrl),
                           backgroundColor: Colors.grey[100],

                        ),
                        contentPadding: EdgeInsets.all(10),
                        title: Text(name , style: TextStyle(fontSize: 25 , fontWeight: FontWeight.bold),),
                        subtitle: Text(email),
                      ),
                      ListTile(
                        leading: Icon(Icons.add),
                        contentPadding: EdgeInsets.all(10),
                        title: Text("Total Appointments" , style: TextStyle(fontSize: 25 , fontWeight: FontWeight.bold)),
                        subtitle: Text("abcd"),
                        trailing: CircleAvatar(
                          child: Text("28",style: TextStyle(fontSize: 25 , fontWeight: FontWeight.bold)),
                        ),
                      ),
                      ListTile(
                        leading: Icon(Icons.remove),
                        contentPadding: EdgeInsets.all(10),
                        title: Text("Appointments Left " , style: TextStyle(fontSize: 25 , fontWeight: FontWeight.bold)),
                        subtitle: Text("abcd"),
                        trailing: CircleAvatar(
                          child: Text("8",style: TextStyle(fontSize: 25 , fontWeight: FontWeight.bold)),
                        ),
                      ),
                      ButtonBar(
                        children: <Widget>[
                          FloatingActionButton(
                            onPressed: (){},
                            child: Icon(Icons.edit),
                            backgroundColor: Colors.white,
                          )
                        ],
                      )
                    ],
                  ),
                )
              ),
              
                      
          ],
        ),
    );
  }
}

