import 'package:flutter/material.dart';

import 'home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 100,
                  height: 100,
                  child: Image.asset('assets/images/bmw.jpg'),
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  onChanged: (valueEmail) {
                    email = valueEmail;
                  },
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      labelText: 'Email', border: OutlineInputBorder()),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  onChanged: (valuePassword) {
                    password = valuePassword;
                  },
                  obscureText: true,
                  decoration: InputDecoration(
                      labelText: 'Senha', border: OutlineInputBorder()),
                ),
                SizedBox(
                  height: 15,
                ),
                ElevatedButton(
                  onPressed: () {
                    if (email == 'teste@email.com' && password == 'teste123') {
                      Navigator.of(context).pushReplacementNamed('/home');
                    } else {
                      print('email ou senha incorretos');
                    }
                  },
                  child: Text('Entrar'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
