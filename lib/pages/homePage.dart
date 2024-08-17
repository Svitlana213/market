import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../auth.dart';

class HomePage extends StatelessWidget{
  HomePage({Key? key}) : super(key: key);

  final User? user = Auth().currentUser;
  Future<void> signOut() async{
    await Auth().signOut();
  }

  Widget _title(){
    return const Text("Auth");
  }
  Widget _userId(){
    return Text (user?.email ?? "User email");
  }
  Widget _signOut(){
    return ElevatedButton(
        onPressed: signOut,
        child: Text("Sign Out"));
  }


  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: _title(),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _userId(),
            _signOut(),
          ],
        ),
      ),
    );

  }

}