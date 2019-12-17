import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final FocusNode _userFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    print(_auth);
    _auth
        .signInWithEmailAndPassword(
            email: 'rodmaster@gmail.com', password: '12345678')
        .then((authResult) => print(authResult.user.email));
  }

  @override
  void dispose() {
    _userFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Material(
          elevation: 2,
          clipBehavior: Clip.antiAlias,
          borderRadius: BorderRadius.circular(16),
          child: Form(
            child: Container(
              padding: const EdgeInsets.all(24),
              constraints: BoxConstraints(maxWidth: 400),
              height: 400,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: <Color>[
                    Colors.lightBlue[900],
                    Colors.lightBlue[700],
                    Colors.lightBlue,
                  ],
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Text(
                    'FAÇA LOGIN',
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 24),
                  RawKeyboardListener(
                    focusNode: _userFocusNode,
                    child: TextFormField(
                      autofocus: true,
                      decoration: InputDecoration(
                        labelText: 'Usuário',
                        labelStyle: TextStyle(color: Colors.white),
                        filled: true,
                        fillColor: Colors.black12,
                        enabledBorder: UnderlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                    onKey: (dynamic key) {
                      if (key.logicalKey.debugName == 'Tab') {
                        FocusScope.of(context).nextFocus();
                      }
                    },
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    focusNode: _passwordFocusNode,
                    decoration: InputDecoration(
                      labelText: 'Senha',
                      labelStyle: TextStyle(color: Colors.white),
                      filled: true,
                      fillColor: Colors.black12,
                      enabledBorder: UnderlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  RaisedButton(
                    padding: const EdgeInsets.symmetric(
                      vertical: 4,
                      horizontal: 24,
                    ),
                    color: Colors.cyan[300],
                    textColor: Colors.white,
                    child: Text('ENTRAR'),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
