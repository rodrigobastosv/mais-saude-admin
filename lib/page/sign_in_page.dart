import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {

  @override
  void initState() {
    super.initState();
    print(_auth);
    _auth.signInWithEmailAndPassword(email: 'rodmaster@gmail.com', password: '12345678')
      .then((authResult) => print(authResult.user.email));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Form(
            child: Padding(
              padding: const EdgeInsets.all(38),
              child: Column(
                children: <Widget>[
                  TextFormField(),
                  TextFormField(),
                  RaisedButton(
                    onPressed: null,
                    child: Text('Login'),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
