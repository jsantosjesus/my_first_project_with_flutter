import 'package:flutter/material.dart';

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
    return Material(
      child: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
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
                    print('login');
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
    );
  }
}
