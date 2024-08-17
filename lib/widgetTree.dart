import 'package:flutter/cupertino.dart';
import 'package:market/pages/homePage.dart';
import 'package:market/pages/loginRegister.dart';
import 'auth.dart';

class WidgetTree extends StatefulWidget {
@override
_WidgetTreeState createState() => _WidgetTreeState();
}

class _WidgetTreeState extends State<WidgetTree> {
  @override
  Widget build(BuildContext context){
    return StreamBuilder(
        stream: Auth().authStateChanges,
        builder: (context, snapshot){
          if(snapshot.hasData){
            return HomePage();
          } else{
            return LoginRegister();
          }
        }
    );
  }
}