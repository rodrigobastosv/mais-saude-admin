import 'package:flutter/material.dart';
import 'package:firebase/firebase.dart';
import 'package:firebase/firestore.dart' as fs;

import 'page/sign_in_page.dart';

void main() {
  initializeApp(
    apiKey: "AIzaSyBxqFo-4nAaokODMqBQLt_7XxhEY8WKhf0",
    authDomain: "mais-saude-28305.firebaseapp.com",
    databaseURL: "https://mais-saude-28305.firebaseio.com",
    projectId: "mais-saude-28305",
    storageBucket: "mais-saude-28305.appspot.com",
  );

  //fs.Firestore store = firestore();
  //fs.CollectionReference ref = store.collection("messages");

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      routes: {
        '/': (context) => SignInPage(),
      },
    );
  }
}
